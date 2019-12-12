Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id D0FAB11CDDA
	for <lists+linuxppc-dev@lfdr.de>; Thu, 12 Dec 2019 14:08:49 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47YYyl0xV8zDqLJ
	for <lists+linuxppc-dev@lfdr.de>; Fri, 13 Dec 2019 00:08:47 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record)
 smtp.mailfrom=bombadil.srs.infradead.org (client-ip=2607:7c80:54:e::133;
 helo=bombadil.infradead.org;
 envelope-from=batv+27c5b7719eecc710bb1c+5954+infradead.org+hch@bombadil.srs.infradead.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=infradead.org header.i=@infradead.org
 header.b="g1naCWSf"; dkim-atps=neutral
Received: from bombadil.infradead.org (bombadil.infradead.org
 [IPv6:2607:7c80:54:e::133])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47YYqx1kCmzDr0x
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 13 Dec 2019 00:02:53 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20170209; h=In-Reply-To:Content-Type:MIME-Version
 :References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=3pJOGHohHWFavJROLCsvbbpIq2FFgge+nGlDVwdmal0=; b=g1naCWSfvuTUKXR8v95IIZSG1
 BlGiIpPknxTsRMpSnCiEmUjjYbYY9FzjMw/OXZ5oo7g14CsZKSLziBJD95QuLvreen+22baOXRWXm
 4+H9kwGV+yaNfcyLubptMXgAEZSmeMrgUylH52O1P7GVPoE6S/T6zj/Fc1QE4QqNm/rFlBt9hxJxS
 WXTX6ouKpkeSk0DpHZa4CCx1pIP/pJ+cqRFmVe/S6P7brDPVwRPn2nHMFc0g14jBdqJ/0g0kzcgQf
 LhN7COXuxzUq2rjj7s7cC1XXLGzRTUD92p3E73Q7hZNU9Xh6r481ElB36bTiT55gJ/sbLRbTOEM96
 TkWhRYC+Q==;
Received: from hch by bombadil.infradead.org with local (Exim 4.92.3 #3 (Red
 Hat Linux)) id 1ifO7E-0006SH-3X; Thu, 12 Dec 2019 13:02:48 +0000
Date: Thu, 12 Dec 2019 05:02:48 -0800
From: Christoph Hellwig <hch@infradead.org>
To: Haren Myneni <haren@linux.ibm.com>
Subject: Re: [PATCH V2 07/13] powerpc/vas: Take reference to PID and mm for
 user space windows
Message-ID: <20191212130248.GE3381@infradead.org>
References: <1575861522.16318.9.camel@hbabu-laptop>
 <1575862366.16318.24.camel@hbabu-laptop>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1575862366.16318.24.camel@hbabu-laptop>
User-Agent: Mutt/1.12.1 (2019-06-15)
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
Cc: devicetree@vger.kernel.org, mikey@neuling.org, herbert@gondor.apana.org.au,
 npiggin@gmail.com, hch@infradead.org, sukadev@linux.vnet.ibm.com,
 linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

> +	if (txwin->user_win) {
> +		/*
> +		 * Window opened by child thread may not be closed when
> +		 * it exits. So take reference to its pid and release it
> +		 * when the window is free by parent thread.
> +		 * Acquire a reference to the task's pid to make sure
> +		 * pid will not be re-used.
> +		 */
> +		txwin->pid = get_task_pid(current, PIDTYPE_PID);
> +		/*
> +		 * Acquire a reference to the task's mm.
> +		 */
> +		txwin->mm = get_task_mm(current);
> +
> +		if (txwin->mm) {
> +			mmput(txwin->mm);
> +			mmgrab(txwin->mm);

Doesn't the mmgrab need to come before the mmput?

> +			mm_context_add_copro(txwin->mm);
> +		} else {
> +			put_pid(txwin->pid);
> +			pr_err("VAS: pid(%d): mm_struct is not found\n",
> +					current->pid);
> +			rc = -EPERM;
> +			goto free_window;
> +		}

Also the code is much easier to follow if you handle the error
first and avoid the else:

		txwin->mm = get_task_mm(current);
		if (!txwin->mm) {
			put_pid(txwin->pid);
			pr_err("VAS: pid(%d): mm_struct is not found\n",
					current->pid);
			rc = -EPERM;
			goto free_window;
		}
		mmgrab(txwin->mm);
		mmput(txwin->mm);

Also don't you need to take a reference to the struct pid for the
tgid as well?
