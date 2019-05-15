Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 61E331F544
	for <lists+linuxppc-dev@lfdr.de>; Wed, 15 May 2019 15:16:42 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 453w7C6cRYzDqXG
	for <lists+linuxppc-dev@lfdr.de>; Wed, 15 May 2019 23:16:39 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (mailfrom)
 smtp.mailfrom=bombadil.srs.infradead.org (client-ip=2607:7c80:54:e::133;
 helo=bombadil.infradead.org;
 envelope-from=batv+738fd1ce08e215645d94+5743+infradead.org+hch@bombadil.srs.infradead.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=infradead.org header.i=@infradead.org
 header.b="rYCXmxJt"; dkim-atps=neutral
Received: from bombadil.infradead.org (bombadil.infradead.org
 [IPv6:2607:7c80:54:e::133])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 453w570ZsWzDqQJ
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 15 May 2019 23:14:51 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20170209; h=In-Reply-To:Content-Type:MIME-Version
 :References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=qShoqLt0JmHyoHgAq3sjRJ0pBZKTFY+W/Ie1+Gslfcs=; b=rYCXmxJt7WIVkj4UyET3hLn4H
 OmfbIB7jIAwSa9Jv4QvcOVmdEuLtr4hR6GYVoIViMZ7bWW94ldFI3s2GeCcXaveKviEIC88Yi5364
 90FxvdcJw6lodstcqCiNE2IioHmGFIGm1uVuP+hLxOXY/UrQHLUWMASdv6psi37jJPfIip/Wxz3Xc
 BTzsy2JNdKHNbhpUAFNeSMPGbiElM4NDeYb8AH1+3ZiU8nrOih5wfVNc1BQUc3TgRe7/4oBj52ZV3
 FJPXQm7UWb0JuyMa2ZJNdmKpwTqgwGQEB9yNibzD05AHHDBxIA4D78Dc377GEBv4O6nuBOghgN5kd
 Y8Kp+Ki5Q==;
Received: from hch by bombadil.infradead.org with local (Exim 4.90_1 #2 (Red
 Hat Linux)) id 1hQtk1-0000z1-RR; Wed, 15 May 2019 13:14:41 +0000
Date: Wed, 15 May 2019 06:14:41 -0700
From: Christoph Hellwig <hch@infradead.org>
To: Mathieu Malaterre <malat@debian.org>
Subject: Re: [PATCH] powerpc: silence a -Wcast-function-type warning in
 dawr_write_file_bool
Message-ID: <20190515131441.GA3072@infradead.org>
References: <20190515120942.3812-1-malat@debian.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190515120942.3812-1-malat@debian.org>
User-Agent: Mutt/1.9.2 (2017-12-15)
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
Cc: Michael Neuling <mikey@neuling.org>, linuxppc-dev@lists.ozlabs.org,
 Paul Mackerras <paulus@samba.org>, linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, May 15, 2019 at 02:09:42PM +0200, Mathieu Malaterre wrote:
> In commit c1fe190c0672 ("powerpc: Add force enable of DAWR on P9
> option") the following piece of code was added:
> 
>    smp_call_function((smp_call_func_t)set_dawr, &null_brk, 0);
> 
> Since GCC 8 this trigger the following warning about incompatible
> function types:

And the warning is there for a reason, and should not be hidden
behind a cast.  This should instead be fixed by something like this:

diff --git a/arch/powerpc/kernel/hw_breakpoint.c b/arch/powerpc/kernel/hw_breakpoint.c
index da307dd93ee3..a26b67a1be83 100644
--- a/arch/powerpc/kernel/hw_breakpoint.c
+++ b/arch/powerpc/kernel/hw_breakpoint.c
@@ -384,6 +384,12 @@ void hw_breakpoint_pmu_read(struct perf_event *bp)
 bool dawr_force_enable;
 EXPORT_SYMBOL_GPL(dawr_force_enable);
 
+
+static void set_dawr_cb(void *info)
+{
+	set_dawr(info);
+}
+
 static ssize_t dawr_write_file_bool(struct file *file,
 				    const char __user *user_buf,
 				    size_t count, loff_t *ppos)
@@ -403,7 +409,7 @@ static ssize_t dawr_write_file_bool(struct file *file,
 
 	/* If we are clearing, make sure all CPUs have the DAWR cleared */
 	if (!dawr_force_enable)
-		smp_call_function((smp_call_func_t)set_dawr, &null_brk, 0);
+		smp_call_function(set_dawr_cb, &null_brk, 0);
 
 	return rc;
 }
