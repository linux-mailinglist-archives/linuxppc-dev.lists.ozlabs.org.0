Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 01C872274A6
	for <lists+linuxppc-dev@lfdr.de>; Tue, 21 Jul 2020 03:38:19 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4B9h7X1SX8zDqXN
	for <lists+linuxppc-dev@lfdr.de>; Tue, 21 Jul 2020 11:38:16 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4B9h5n2nb8zDqG8
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 21 Jul 2020 11:36:45 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au
 header.a=rsa-sha256 header.s=201909 header.b=HYOKyShO; 
 dkim-atps=neutral
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4B9h5l5jkjz9sRN;
 Tue, 21 Jul 2020 11:36:43 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ellerman.id.au;
 s=201909; t=1595295403;
 bh=O1TfX05NIO2WZeLXlu/nPLJUyilhqS6PY3xKAiCJwAs=;
 h=From:To:Subject:In-Reply-To:References:Date:From;
 b=HYOKyShOehcslX/AxMCB1Ypdoi5lZTu73At0XTUvxS9fKxACioUHHIIEVF63G/MZU
 tFMRmMbK2yGoFPq/LyHWqwSo2xS1/sAu0z3wC2dm/HyLuDbVwD8kc9r7+Uoo9YGUuA
 JNDqS+O+Q/UWkZm78Hw/rlY3SfzdJchm4pKsc5Mfnd1OsTrw0fQbNa27/pYgSocZRo
 PL5QQwXyyBZnLbzXJrTGT1R0SLWHp2nd/1QnD4ilL8dnDCpazDYuY1EWdjm7FnV0Oo
 8T7ehny5V6NnAbUTh4HH6iIAnK0E4rgd8AH3MGf5gbMT8NusTmJaUYYwLaWBXA0PFn
 c/NpbTPmaQ9Fw==
From: Michael Ellerman <mpe@ellerman.id.au>
To: Daniel Henrique Barboza <danielhb413@gmail.com>,
 linuxppc-dev@lists.ozlabs.org
Subject: Re: Question about NUMA distance calculation in powerpc/mm/numa.c
In-Reply-To: <e5c3b1f1-d6ac-50d5-95f5-3c6e830a078e@gmail.com>
References: <e5c3b1f1-d6ac-50d5-95f5-3c6e830a078e@gmail.com>
Date: Tue, 21 Jul 2020 11:36:40 +1000
Message-ID: <87wo2xsl7b.fsf@mpe.ellerman.id.au>
MIME-Version: 1.0
Content-Type: text/plain
X-BeenThere: linuxppc-dev@lists.ozlabs.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux on PowerPC Developers Mail List <linuxppc-dev.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/linuxppc-dev>,
 <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/linuxppc-dev>,
 <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=subscribe>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Daniel Henrique Barboza <danielhb413@gmail.com> writes:
> Hello,
>
>
> I didn't find an explanation about the 'double the distance' logic in
> 'git log' or anywhere in the kernel docs:
>
>
> (arch/powerpc/mm/numa.c, __node_distance()):

Adding more context:

  int distance = LOCAL_DISTANCE;
  ...

> for (i = 0; i < distance_ref_points_depth; i++) {
> 	if (distance_lookup_table[a][i] == distance_lookup_table[b][i])
> 		break;
>
> 	/* Double the distance for each NUMA level */
> 	distance *= 2;
> }

And:

#define LOCAL_DISTANCE		10
#define REMOTE_DISTANCE		20


So AFAICS the doubling is just a way to ensure we go from LOCAL_DISTANCE
to REMOTE_DISTANCE at the first level, and then after that it's fairly
arbitrary.

cheers
