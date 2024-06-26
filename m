Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id A8A20917A95
	for <lists+linuxppc-dev@lfdr.de>; Wed, 26 Jun 2024 10:12:58 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=p2zqrLQJ;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4W8Dw710K5z3cFw
	for <lists+linuxppc-dev@lfdr.de>; Wed, 26 Jun 2024 18:12:55 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=ellerman.id.au
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=p2zqrLQJ;
	dkim-atps=neutral
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4W8DvQ2Qv8z30VT
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 26 Jun 2024 18:12:18 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
	s=201909; t=1719389539;
	bh=r5GZ/pj9X/ZHyF8H3UlvCNeqEgkIup+IGxBA0hbV6Vw=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=p2zqrLQJcuuLebAMxSHJdYmJVFVODMKmjqdCQWKRHFFG90Vdly1OzxttB0eIRxfTt
	 l7mRr9cO15o9zK061+wQZTDt7tqsxga4aii5ty9x/xX4fpzQB4EM18rNaSytDE0NsN
	 oenHzziOY4nPqBddlbHEF8iMrvqEW2KcTfXjyfHcKbmbQaQ9zz9dleplz4eSrigVmI
	 YOQ/XQOFukSJmDGa9MVqN2egDowwpdFTeok9M+Bg9eFiPWbmR+g77yUvQPc8zii428
	 jL3cc1U3AWtvFfvbN4WXjXo6EA8bYtVW8pudLP/zD4kzkFVvgP+bmYsc3O5Ii/bCte
	 r0FVdKJAaGBtA==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4W8DvQ5YPhz4w2D;
	Wed, 26 Jun 2024 18:12:18 +1000 (AEST)
From: Michael Ellerman <mpe@ellerman.id.au>
To: Ritesh Harjani <ritesh.list@gmail.com>, Madhavan Srinivasan
 <maddy@linux.ibm.com>
Subject: Re: [PATCH 2/3] powerpc/pseries: Export hardware trace macro dump
 via debugfs
In-Reply-To: <87msnd5st9.fsf@gmail.com>
References: <20240620174614.53751-1-maddy@linux.ibm.com>
 <20240620174614.53751-2-maddy@linux.ibm.com> <87msnd5st9.fsf@gmail.com>
Date: Wed, 26 Jun 2024 18:12:17 +1000
Message-ID: <87v81wp1ge.fsf@mail.lhotse>
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
Cc: atrajeev@linux.vnet.ibm.com, kjain@linux.ibm.com, npiggin@gmail.com, Madhavan Srinivasan <maddy@linux.ibm.com>, christophe.leroy@csgroup.eu, naveen.n.rao@linux.ibm.com, disgoel@linux.vnet.ibm.com, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Ritesh Harjani (IBM) <ritesh.list@gmail.com> writes:
> This is a generic review and I haven't looked into the PAPR spec for
> htmdump hcall and it's interface.
>
> Madhavan Srinivasan <maddy@linux.ibm.com> writes:
...
>> +
>> +	debugfs_create_u32("nodeindex", 0600,
>> +			htmdump_debugfs_dir, &nodeindex);
>> +	debugfs_create_u32("nodalchipindex", 0600,
>> +			htmdump_debugfs_dir, &nodalchipindex);
>> +	debugfs_create_u32("coreindexonchip", 0600,
>> +			htmdump_debugfs_dir, &coreindexonchip);
>> +	debugfs_create_u32("htmtype", 0600,
>> +			htmdump_debugfs_dir, &htmtype);
>
> minor nit: For all of the above. S_IRUSR | S_IWUSR instead of 0600.
>
>> +	debugfs_create_file("trace", 0400, htmdump_debugfs_dir, ent, &htmdump_fops);
>
> maybe S_IRUSR instead of 0400.

Actually we prefer the octal values, see:
  https://git.kernel.org/torvalds/c/57ad583f2086d55ada284c54bfc440123cf73964

cheers
