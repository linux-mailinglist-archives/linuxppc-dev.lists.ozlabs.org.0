Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 5328E2B021A
	for <lists+linuxppc-dev@lfdr.de>; Thu, 12 Nov 2020 10:40:08 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CWxQq3CqRzDqyH
	for <lists+linuxppc-dev@lfdr.de>; Thu, 12 Nov 2020 20:40:03 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record)
 smtp.mailfrom=casper.srs.infradead.org (client-ip=90.155.50.34;
 helo=casper.infradead.org;
 envelope-from=batv+1daa237d4ffab96b8ef1+6290+infradead.org+hch@casper.srs.infradead.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=infradead.org
Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CWxP42kQZzDqwm
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 12 Nov 2020 20:38:32 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=cnWNfTHVU4AEXtUdky7SzwT/9uPYUSiJsLa4+lGu8a8=; b=TS+osSOLMCGS4fDhHQTgjKOJng
 BYlhxXc3gLOHA83cYAk937kLntXcC6InGwuROC6f3+DNXtadbsoCtWKcuJq+4QHBcbLIDJXRnhv3O
 TgwYa19YZrdoay+00fILS+4mXPV1zn86DlTvKunG6818dlenu1z6R3vqxPitwFciMy3bGiQGufPJV
 f85noQ79w/nqcaXyIVlVKqbi3tUtgKvqyDQXPbTV+4lGzFZl0h/X1Ata7YI/5k7OM45eG+xWULmyy
 Ae6xOmkLS4xDI8cDZW7qMIiesvh1sXT1IzJFPRfrYe107Ic/sVtMZqYTGKf16h6YLtppwPKFPMdAy
 wnh82Y0g==;
Received: from hch by casper.infradead.org with local (Exim 4.92.3 #3 (Red Hat
 Linux)) id 1kd93A-0006O5-8p; Thu, 12 Nov 2020 09:37:52 +0000
Date: Thu, 12 Nov 2020 09:37:52 +0000
From: Christoph Hellwig <hch@infradead.org>
To: Tyrel Datwyler <tyreld@linux.ibm.com>
Subject: Re: [PATCH 1/6] ibmvfc: byte swap login_buf.resp values in attribute
 show functions
Message-ID: <20201112093752.GA24235@infradead.org>
References: <20201112010442.102589-1-tyreld@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201112010442.102589-1-tyreld@linux.ibm.com>
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
Cc: martin.petersen@oracle.com, linux-scsi@vger.kernel.org,
 linux-kernel@vger.kernel.org, james.bottomley@hansenpartnership.com,
 brking@linux.ibm.com, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, Nov 11, 2020 at 07:04:37PM -0600, Tyrel Datwyler wrote:
> Both ibmvfc_show_host_(capabilities|npiv_version) functions retrieve
> values from vhost->login_buf.resp buffer. This is the MAD response
> buffer from the VIOS and as such any multi-byte non-string values are in
> big endian format.
> 
> Byte swap these values to host cpu endian format for better human
> readability.

The whole series creates tons of pointlessly over 80 char lines.
Please do a quick fixup.
