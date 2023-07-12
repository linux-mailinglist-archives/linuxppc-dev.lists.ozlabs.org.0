Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 74932751385
	for <lists+linuxppc-dev@lfdr.de>; Thu, 13 Jul 2023 00:27:14 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=df/VKiT9;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4R1XRN2qtQz3c3W
	for <lists+linuxppc-dev@lfdr.de>; Thu, 13 Jul 2023 08:27:12 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=df/VKiT9;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=infradead.org (client-ip=2607:7c80:54:3::133; helo=bombadil.infradead.org; envelope-from=rdunlap@infradead.org; receiver=lists.ozlabs.org)
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:3::133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4R1MM907y8z3bWr;
	Thu, 13 Jul 2023 01:37:56 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:To:Subject:MIME-Version:Date:
	Message-ID:Sender:Reply-To:Cc:Content-ID:Content-Description;
	bh=689SEK0ciFY8KgDlRHFBreHHAC2z+cvH0wQ011Q2aMI=; b=df/VKiT91ZqRa0x7ofoJaXGlph
	PM7CRP4KkwoXZKNJlvYdkig+/LLrQ9LVGVf40H6Qaywx20JwTqHlizlUxF15FF/hdi7QMcfJ88rOM
	Tk9o3z44pMTcermnTCrLWAF39fzqRsD0ms+1lMmZtzToJzTD0SUcPG6eXBFgIigvbDeEBrSIYXiW/
	GnykGmmqxl8DWPpBQb6tfrtLGgdO7lnddHDuy7SXW0bC9E1PhpCLadB/V3QSWJPX+bNFvOifeRdsy
	3Vg5gSGOgGr74Cyg+9z9dxsezgnvq5bViTggfgF6K6g7cj7jT1ssxpJXUEt4gBcr4IJbEN74vqTce
	EZsIkLBg==;
Received: from [2601:1c2:980:9ec0::2764]
	by bombadil.infradead.org with esmtpsa (Exim 4.96 #2 (Red Hat Linux))
	id 1qJboy-000MRl-20;
	Wed, 12 Jul 2023 15:32:04 +0000
Message-ID: <03e153ce-328b-f279-2a40-4074bea2bc8f@infradead.org>
Date: Wed, 12 Jul 2023 08:31:55 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH 01/79] fs: add ctime accessors infrastructure
Content-Language: en-US
To: Jeff Layton <jlayton@kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Linux FS-devel Mailing List <linux-fsdevel@vger.kernel.org>,
 linux-um <linux-um@lists.infradead.org>
References: <20230621144507.55591-1-jlayton@kernel.org>
 <20230621144507.55591-2-jlayton@kernel.org>
From: Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <20230621144507.55591-2-jlayton@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Mailman-Approved-At: Thu, 13 Jul 2023 08:26:22 +1000
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
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi Jeff,

On arch/um/, (subarch i386 or x86_64), hostfs build fails with:

../fs/hostfs/hostfs_kern.c:520:36: error: incompatible type for arg
ument 2 of 'inode_set_ctime_to_ts'
../include/linux/fs.h:1499:73: note: expected 'struct timespec64' b
ut argument is of type 'const struct hostfs_timespec *'


-- 
~Randy
