Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E4CE7C36C
	for <lists+linuxppc-dev@lfdr.de>; Wed, 31 Jul 2019 15:26:15 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45zDhj0FP7zDqcj
	for <lists+linuxppc-dev@lfdr.de>; Wed, 31 Jul 2019 23:26:13 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45zBQ20XVDzDqfc
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 31 Jul 2019 21:43:22 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 45zBQ14ftsz9s00;
 Wed, 31 Jul 2019 21:43:21 +1000 (AEST)
From: Michael Ellerman <mpe@ellerman.id.au>
To: Andrew Donnellan <ajd@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org
Subject: Re: [PATCH v2] powerpc/powernv: Restrict OPAL symbol map to only be
 readable by root
In-Reply-To: <2a934abd-07c0-2741-8f2e-b9224abde005@linux.ibm.com>
References: <20190503075253.22798-1-ajd@linux.ibm.com>
 <2a934abd-07c0-2741-8f2e-b9224abde005@linux.ibm.com>
Date: Wed, 31 Jul 2019 21:43:21 +1000
Message-ID: <87h872qvja.fsf@concordia.ellerman.id.au>
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
Cc: Jordan Niethe <jniethe5@gmail.com>, stable@vger.kernel.org,
 Stewart Smith <stewart@linux.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Andrew Donnellan <ajd@linux.ibm.com> writes:
> On 3/5/19 5:52 pm, Andrew Donnellan wrote:
>> Currently the OPAL symbol map is globally readable, which seems bad as it
>> contains physical addresses.
>> 
>> Restrict it to root.
>> 
>> Suggested-by: Michael Ellerman <mpe@ellerman.id.au>
>> Cc: Jordan Niethe <jniethe5@gmail.com>
>> Cc: Stewart Smith <stewart@linux.ibm.com>
>> Fixes: c8742f85125d ("powerpc/powernv: Expose OPAL firmware symbol map")
>> Cc: stable@vger.kernel.org
>> Signed-off-by: Andrew Donnellan <ajd@linux.ibm.com>
>
> mpe: ping?

Picked up for v5.4.

cheers
