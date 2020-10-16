Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 9957028FEA6
	for <lists+linuxppc-dev@lfdr.de>; Fri, 16 Oct 2020 08:55:59 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CCH3w3rM9zDqd3
	for <lists+linuxppc-dev@lfdr.de>; Fri, 16 Oct 2020 17:55:56 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record)
 smtp.mailfrom=casper.srs.infradead.org (client-ip=2001:8b0:10b:1236::1;
 helo=casper.infradead.org;
 envelope-from=batv+3f298eef0c732a4c5343+6263+infradead.org+hch@casper.srs.infradead.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 secure) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256
 header.s=casper.20170209 header.b=ndM3N2H9; 
 dkim-atps=neutral
Received: from casper.infradead.org (casper.infradead.org
 [IPv6:2001:8b0:10b:1236::1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CCH225sZlzDqVF
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 16 Oct 2020 17:54:15 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=6qmV6T/fkjw04YEk4tETd5MpPwH/0OOPAH2ymP/DpVc=; b=ndM3N2H9UJgv0dwSmm6hAx628h
 Hf6/x7fwbqfjb71sajdhWuHIdexSlUT6qZmoBnrUPftILWZJrSxKRkHQOKRFr/SL0J5xsFisirEHu
 XXl3i4wFRhBxPGO8cF0ilc88GjbGphNnwUCVQ723Pr1nYon64Qxx3WfPINc+aGQKDubqhm75AWa19
 0AMOAp/6O2St/+im05QN0aok38sjTB9vYYjApnZRfJy7GIfEuVUuI/yz6h/Unz6l53LdkYP0o4Bx4
 lx6sbKjnUDN1wnpe1yHIIDarGrOUyQ/PoTWRdETrUjQfdl4bNsG85Xiucbhc6bpQMBcyKwaZToyWz
 WqxkeE+w==;
Received: from hch by casper.infradead.org with local (Exim 4.92.3 #3 (Red Hat
 Linux)) id 1kTJcp-0002W2-I9; Fri, 16 Oct 2020 06:54:03 +0000
Date: Fri, 16 Oct 2020 07:54:03 +0100
From: Christoph Hellwig <hch@infradead.org>
To: "Christopher M. Riedl" <cmr@codefail.de>
Subject: Re: [PATCH 1/8] powerpc/uaccess: Add unsafe_copy_from_user
Message-ID: <20201016065403.GA9343@infradead.org>
References: <20201015150159.28933-1-cmr@codefail.de>
 <20201015150159.28933-2-cmr@codefail.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201015150159.28933-2-cmr@codefail.de>
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by
 casper.infradead.org. See http://www.infradead.org/rpr.html
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
Cc: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org,
 viro@zeniv.linux.org.uk
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, Oct 15, 2020 at 10:01:52AM -0500, Christopher M. Riedl wrote:
> Implement raw_copy_from_user_allowed() which assumes that userspace read
> access is open. Use this new function to implement raw_copy_from_user().
> Finally, wrap the new function to follow the usual "unsafe_" convention
> of taking a label argument. The new raw_copy_from_user_allowed() calls
> __copy_tofrom_user() internally, but this is still safe to call in user
> access blocks formed with user_*_access_begin()/user_*_access_end()
> since asm functions are not instrumented for tracing.

Please also add a fallback unsafe_copy_from_user to linux/uaccess.h
so this can be used as a generic API.
