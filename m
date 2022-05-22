Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 56F81530136
	for <lists+linuxppc-dev@lfdr.de>; Sun, 22 May 2022 08:10:03 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4L5VRr6SfTz2xC3
	for <lists+linuxppc-dev@lfdr.de>; Sun, 22 May 2022 16:10:00 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=dVrwKB+a;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record)
 smtp.mailfrom=bombadil.srs.infradead.org (client-ip=2607:7c80:54:e::133;
 helo=bombadil.infradead.org;
 envelope-from=batv+c9e7f944c22607b8b784+6846+infradead.org+hch@bombadil.srs.infradead.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 secure) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256
 header.s=bombadil.20210309 header.b=dVrwKB+a; 
 dkim-atps=neutral
Received: from bombadil.infradead.org (bombadil.infradead.org
 [IPv6:2607:7c80:54:e::133])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4L5VR76Zlgz303D
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 22 May 2022 16:09:18 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=In-Reply-To:Content-Type:MIME-Version
 :References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=f8vODVBPPT4aieHBVtPQZPwEE8oetsAgiBP0SHP03Ns=; b=dVrwKB+az4x8MRcYyIRObMC3Kz
 0/Lk5RsZ/uHq7rxWTwLfDctoffMnHd/XYI6CywnbwDoBtQ0kGP0IAReMVRjqBcN7i0SOfz0WyQzjA
 72LMGsN8V9ohaRMa+yuZL8XoU9VwEiQiE2PgbZvQra5fAtbw50/0JLdprjgLYkqxfuWFiZ6BP/ylm
 NxxYXDcrYvan5XviHSu6Iu2oEMAP9rTCG164FVGAiNtLsWVSqGCba2HcD3pGV4AYzuLQExeQAeT4l
 L1Dtehj+OTr3rq74yGZS0MDlKvD/f3IME9yzaWi1wHGZN47KQaz/+4mUl1RmIeJIrS4yLTIpAl1X9
 obWQzOxQ==;
Received: from hch by bombadil.infradead.org with local (Exim 4.94.2 #2 (Red
 Hat Linux)) id 1nsekq-000fUe-8y; Sun, 22 May 2022 06:07:52 +0000
Date: Sat, 21 May 2022 23:07:52 -0700
From: Christoph Hellwig <hch@infradead.org>
To: Maninder Singh <maninder1.s@samsung.com>
Subject: Re: [PATCH 0/5] kallsyms: make kallsym APIs more safe with scnprintf
Message-ID: <YonTOL4zC4CytVrn@infradead.org>
References: <CGME20220520083715epcas5p400b11adef4d540756c985feb20ba29bc@epcas5p4.samsung.com>
 <20220520083701.2610975-1-maninder1.s@samsung.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220520083701.2610975-1-maninder1.s@samsung.com>
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by
 bombadil.infradead.org. See http://www.infradead.org/rpr.html
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
Cc: peterz@infradead.org, linux@rasmusvillemoes.dk,
 linux-kernel@vger.kernel.org, paulus@samba.org, linux-hexagon@vger.kernel.org,
 agordeev@linux.ibm.com, will@kernel.org, linux-s390@vger.kernel.org,
 daniel.thompson@linaro.org, arnd@arndb.de, linux-scsi@vger.kernel.org,
 onkarnath.1@samsung.com, anil.s.keshavamurthy@intel.com, kartilak@cisco.com,
 kgdb-bugreport@lists.sourceforge.net, naveen.n.rao@linux.ibm.com,
 longman@redhat.com, borntraeger@linux.ibm.com, jejb@linux.ibm.com,
 mhiramat@kernel.org, v.narang@samsung.com, pmladek@suse.com,
 satishkh@cisco.com, boqun.feng@gmail.com, keescook@chromium.org,
 gor@linux.ibm.com, hca@linux.ibm.com, rostedt@goodmis.org,
 andriy.shevchenko@linux.intel.com, mingo@redhat.com, bcain@quicinc.com,
 martin.petersen@oracle.com, dianders@chromium.org, sebaddel@cisco.com,
 senozhatsky@chromium.org, mcgrof@kernel.org, svens@linux.ibm.com,
 jason.wessel@windriver.com, linux-fsdevel@vger.kernel.org,
 akpm@linux-foundation.org, linuxppc-dev@lists.ozlabs.org, davem@davemloft.net,
 linux-modules@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, May 20, 2022 at 02:06:56PM +0530, Maninder Singh wrote:
> kallsyms functionality depends on KSYM_NAME_LEN directly.
> but if user passed array length lesser than it, sprintf
> can cause issues of buffer overflow attack.
> 
> So changing *sprint* and *lookup* APIs in this patch set
> to have buffer size as an argument and replacing sprintf with
> scnprintf.

This is still a pretty horrible API.  Passing something like
a struct seq_buf seems like the much better API here.  Also with
the amount of arguments and by reference passing it might be worth
to pass them as a structure while you're at it.

