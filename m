Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id AFADC895610
	for <lists+linuxppc-dev@lfdr.de>; Tue,  2 Apr 2024 16:03:08 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; secure) header.d=wetzel-home.de header.i=@wetzel-home.de header.a=rsa-sha256 header.s=wetzel-home header.b=uwHSo1tf;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4V88jQ2FdCz3dfM
	for <lists+linuxppc-dev@lfdr.de>; Wed,  3 Apr 2024 01:03:06 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; secure) header.d=wetzel-home.de header.i=@wetzel-home.de header.a=rsa-sha256 header.s=wetzel-home header.b=uwHSo1tf;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=wetzel-home.de (client-ip=2a03:4000:40:5b2::1; helo=ns2.wdyn.eu; envelope-from=alexander@wetzel-home.de; receiver=lists.ozlabs.org)
Received: from ns2.wdyn.eu (ns2.wdyn.eu [IPv6:2a03:4000:40:5b2::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4V88hd6g20z3cCx
	for <linuxppc-dev@lists.ozlabs.org>; Wed,  3 Apr 2024 01:02:22 +1100 (AEDT)
Message-ID: <c5354ac2-5714-42ce-bf2f-9d022ddd2945@wetzel-home.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=wetzel-home.de;
	s=wetzel-home; t=1712066534;
	bh=+KeKKu8j5PtDlcTYULHI2jYuASxxmJesbzSHT/V5rDI=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=uwHSo1tfz2wKMcCsEBf9bEAqr84kDSQ4hG6VxetzuNCQxCaRlZgUmTLH7lEiU8nPw
	 8rZ4gXr2y21VmkbxeAFdUbauLTt8MHFwqAqGVmpY9klkR8Sz3drGHT6Xzg9i9k0yag
	 5aDtHYeWQJY3rWD7enRekLfJNaBAyrbWWDLkBIA4=
Date: Tue, 2 Apr 2024 16:02:10 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [Revert commit 27f58c04a8f438078583041468ec60597841284d]
 [linux-next] [6.9.0-rc1-next-20240328] WARNING: CPU: 9 PID: 209 at
 drivers/scsi/sg.c:2236 sg_remove_sfp_usercontext+0x270/0x280 [sg]
To: Venkat Rao Bagalkote <venkat88@linux.vnet.ibm.com>, bvanassche@acm.org,
 martin.petersen@oracle.com, linux-kernel@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org
References: <62efbf21-fdb5-4c3b-a370-085b39672b72@linux.vnet.ibm.com>
Content-Language: en-US, de-DE
From: Alexander Wetzel <alexander@wetzel-home.de>
In-Reply-To: <62efbf21-fdb5-4c3b-a370-085b39672b72@linux.vnet.ibm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
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
Cc: sachinp@linux.vnet.com, sfr@canb.auug.org.au, mputtash@linux.vnet.com, abdhalee@linux.vnet.ibm.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 02.04.24 15:51, Venkat Rao Bagalkote wrote:
> Greetings!!
> 
> 
> Below warnings is observed with the commit 
> 27f58c04a8f438078583041468ec60597841284d.
> 
> 
> Once reverting the above commit id, issue is resloved.
> 
> 
> Please help in fixing this issue.

The fix for that is currently in review:
https://lore.kernel.org/all/20240401191038.18359-1-Alexander@wetzel-home.de/

Sorry for that,

Alexander
