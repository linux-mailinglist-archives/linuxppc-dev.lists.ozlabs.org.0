Return-Path: <linuxppc-dev+bounces-9447-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F276ADF22C
	for <lists+linuxppc-dev@lfdr.de>; Wed, 18 Jun 2025 18:10:16 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bMpc35bbwz2yKq;
	Thu, 19 Jun 2025 02:10:11 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=23.155.224.40
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1750263011;
	cv=none; b=N0mrS7KdUCTwMt3fwdLGijDmNruPGzFJzGi21CWyzHJ+N6Eh3mk50JM7jv7rMuSVxEuQb66hxgZb6bB761h6HfCE7wLLB/7e2N5v3pp/vb/3Ku2TBYIvWXFiqZ+5mCr1kpd9CfTD93nhRWcpEGqZi8BqmUgdPxdKQxxisUX/HHKlxQGFzPeKjS3Lb7vzfLPx0Fi7hoCASvr97FNNCBDCmqEy9EXMNBCpKVPzfLxDVwPep+sepLcVg3MyGSlGNabldMP2Y8Vq56rIBgpWDQpv8Dn8CT1m5yw7T5PTNxgw1bKHpm01I4EY3/bHqfTQgu1stYNLPFJf+vn8JjmGFh+krQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1750263011; c=relaxed/relaxed;
	bh=jzmacsdU6uI9FhGkK2oO6/7D6m0SuoLy6Bj4U6ELlRA=;
	h=Date:From:To:Cc:Message-ID:In-Reply-To:References:Subject:
	 MIME-Version:Content-Type; b=Yrezp96t/0NW8sNpx/SRtJDZzfVD9NkrnhudWRaeQX38Zx5DUkhAGd5+Cx/T1hxxU+97ZWjs5MZvuULYmdgFdbVvDrX6UyoKlcg2+IYzV1jcjqpC+0ZoKncldkZeCIZUlwAviounOvfOusyWW/X9heu5T/sGFsRtC2A+SNmEl7vBax5x+x7hbfLKxB/z6/4WY8P565wOc8bBGmzz5TOO3QBJgqHNxLtOeVNuhIItMTsEuK5Lqbm9eT1QkpUWI70gJBS/IwBbchiurYAZarxaxwLgWWpuM7PJXPTNaxMiPTzorHl7aXf4hYcg5ZyaxhESyQCouxSWYgguHIR7yYZtiA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=raptorengineering.com; dkim=pass (1024-bit key; secure) header.d=raptorengineering.com header.i=@raptorengineering.com header.a=rsa-sha256 header.s=B8E824E6-0BE2-11E6-931D-288C65937AAD header.b=mUshL+nz; dkim-atps=neutral; spf=pass (client-ip=23.155.224.40; helo=raptorengineering.com; envelope-from=tpearson@raptorengineering.com; receiver=lists.ozlabs.org) smtp.mailfrom=raptorengineering.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=raptorengineering.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; secure) header.d=raptorengineering.com header.i=@raptorengineering.com header.a=rsa-sha256 header.s=B8E824E6-0BE2-11E6-931D-288C65937AAD header.b=mUshL+nz;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=raptorengineering.com (client-ip=23.155.224.40; helo=raptorengineering.com; envelope-from=tpearson@raptorengineering.com; receiver=lists.ozlabs.org)
Received: from raptorengineering.com (mail.raptorengineering.com [23.155.224.40])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4bMpc210zHz2xS0
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 19 Jun 2025 02:10:09 +1000 (AEST)
Received: from localhost (localhost [127.0.0.1])
	by mail.rptsys.com (Postfix) with ESMTP id 455FF82888DD;
	Wed, 18 Jun 2025 11:10:06 -0500 (CDT)
Received: from mail.rptsys.com ([127.0.0.1])
	by localhost (vali.starlink.edu [127.0.0.1]) (amavisd-new, port 10032)
	with ESMTP id X_pUIaLZDl61; Wed, 18 Jun 2025 11:10:02 -0500 (CDT)
Received: from localhost (localhost [127.0.0.1])
	by mail.rptsys.com (Postfix) with ESMTP id 909B88288871;
	Wed, 18 Jun 2025 11:10:02 -0500 (CDT)
DKIM-Filter: OpenDKIM Filter v2.10.3 mail.rptsys.com 909B88288871
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=raptorengineering.com; s=B8E824E6-0BE2-11E6-931D-288C65937AAD;
	t=1750263002; bh=jzmacsdU6uI9FhGkK2oO6/7D6m0SuoLy6Bj4U6ELlRA=;
	h=Date:From:To:Message-ID:MIME-Version;
	b=mUshL+nzI8gkBXELnjg9WBeHhA5NGuq1DLusUDrP6UwP2TxvvudbCMreU7GQQIk0U
	 BXQR9Lj73ak0tJhV4RUCgMsfbGCkqexCCemoZ252ZbK9TEHxFHCJCiz+43KufZTfLv
	 ATErfBUqQ7E1g+fNFa4smT7cdZ1BJHrm+BeYO0m0=
X-Virus-Scanned: amavisd-new at rptsys.com
Received: from mail.rptsys.com ([127.0.0.1])
	by localhost (vali.starlink.edu [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id JI3qCWrOjecK; Wed, 18 Jun 2025 11:10:02 -0500 (CDT)
Received: from vali.starlink.edu (localhost [127.0.0.1])
	by mail.rptsys.com (Postfix) with ESMTP id 4C0C382882C6;
	Wed, 18 Jun 2025 11:10:02 -0500 (CDT)
Date: Wed, 18 Jun 2025 11:10:02 -0500 (CDT)
From: Timothy Pearson <tpearson@raptorengineering.com>
To: Christoph Hellwig <hch@infradead.org>
Cc: linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, 
	linux-kernel <linux-kernel@vger.kernel.org>, 
	linux-pci <linux-pci@vger.kernel.org>, 
	Madhavan Srinivasan <maddy@linux.ibm.com>, 
	Michael Ellerman <mpe@ellerman.id.au>, 
	christophe leroy <christophe.leroy@csgroup.eu>, 
	Naveen N Rao <naveen@kernel.org>, 
	Bjorn Helgaas <bhelgaas@google.com>, 
	Shawn Anastasio <sanastasio@raptorengineering.com>
Message-ID: <1728509613.1310543.1750263002144.JavaMail.zimbra@raptorengineeringinc.com>
In-Reply-To: <aFJQ8AtYlKx1t_ri@infradead.org>
References: <946966095.1309769.1750220559201.JavaMail.zimbra@raptorengineeringinc.com> <aFJQ8AtYlKx1t_ri@infradead.org>
Subject: Re: [PATCH 3/8] powerpc/pseries/eeh: Export eeh_unfreeze_pe() and
 eeh_ops
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Owner: <mailto:linuxppc-dev+owner@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Archive: <https://lore.kernel.org/linuxppc-dev/>,
  <https://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
X-Mailer: Zimbra 8.5.0_GA_3042 (ZimbraWebClient - GC137 (Linux)/8.5.0_GA_3042)
Thread-Topic: powerpc/pseries/eeh: Export eeh_unfreeze_pe() and eeh_ops
Thread-Index: bupdJGUzprnsSSzB+HYmaNkawJnfUQ==
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS autolearn=disabled
	version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org



----- Original Message -----
> From: "Christoph Hellwig" <hch@infradead.org>
> To: "Timothy Pearson" <tpearson@raptorengineering.com>
> Cc: "linuxppc-dev" <linuxppc-dev@lists.ozlabs.org>, "linux-kernel" <linux-kernel@vger.kernel.org>, "linux-pci"
> <linux-pci@vger.kernel.org>, "Madhavan Srinivasan" <maddy@linux.ibm.com>, "Michael Ellerman" <mpe@ellerman.id.au>,
> "christophe leroy" <christophe.leroy@csgroup.eu>, "Naveen N Rao" <naveen@kernel.org>, "Bjorn Helgaas"
> <bhelgaas@google.com>, "Shawn Anastasio" <sanastasio@raptorengineering.com>
> Sent: Wednesday, June 18, 2025 12:38:56 AM
> Subject: Re: [PATCH 3/8] powerpc/pseries/eeh: Export eeh_unfreeze_pe() and eeh_ops

> On Tue, Jun 17, 2025 at 11:22:39PM -0500, Timothy Pearson wrote:
>>  /* Platform dependent EEH operations */
>>  struct eeh_ops *eeh_ops = NULL;
>> +EXPORT_SYMBOL(eeh_ops);
> 
> Exporting ops vectors is generally a really bad idea.  Please build a
> proper abstraction instead.
> 
> And use EXPORT_SYMBOL_GPL for any kind of low-level API.

Fair enough.  I'll add a properly exported method for PE get_state() and update the series in the next couple of days.

