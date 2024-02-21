Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C2C685EC90
	for <lists+linuxppc-dev@lfdr.de>; Thu, 22 Feb 2024 00:09:58 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TgBnH5Yd8z3cZL
	for <lists+linuxppc-dev@lfdr.de>; Thu, 22 Feb 2024 10:09:55 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4TgBmp3GT6z2ykC
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 22 Feb 2024 10:09:30 +1100 (AEDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4TgBmk6Vn1z4wyg;
	Thu, 22 Feb 2024 10:09:26 +1100 (AEDT)
From: Michael Ellerman <patch-notifications@ellerman.id.au>
To: Shrikanth Hegde <sshegde@linux.ibm.com>
In-Reply-To: <20240216053016.528906-1-sshegde@linux.ibm.com>
References: <20240216053016.528906-1-sshegde@linux.ibm.com>
Subject: Re: [PATCH] arch/powerpc: Remove duplicate ifdefs
Message-Id: <170855692315.1938434.8867919999875330398.b4-ty@ellerman.id.au>
Date: Thu, 22 Feb 2024 10:08:43 +1100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
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
Cc: aneesh.kumar@kernel.org, naveen.n.rao@linux.ibm.com, linuxppc-dev@lists.ozlabs.org, npiggin@gmail.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, 16 Feb 2024 11:00:16 +0530, Shrikanth Hegde wrote:
> When a ifdef is used in the below manner, second one could be considered as
> duplicate.
> 
> ifdef DEFINE_A
> ...code block...
> ifdef DEFINE_A       <-- This is a duplicate.
> ...code block...
> endif
> else
> ifndef DEFINE_A     <-- This is also duplicate.
> ...code block...
> endif
> endif
> More details about the script and methods used to find these code
> patterns are in cover letter of [1]
> 
> [...]

Applied to powerpc/next.

[1/1] arch/powerpc: Remove duplicate ifdefs
      https://git.kernel.org/powerpc/c/8c328de8fd5046eb3ec5a7ff7b682a8175e986c3

cheers
