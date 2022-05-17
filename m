Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 61F8C52AE26
	for <lists+linuxppc-dev@lfdr.de>; Wed, 18 May 2022 00:29:06 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4L2rPk21xqz3cGZ
	for <lists+linuxppc-dev@lfdr.de>; Wed, 18 May 2022 08:28:58 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=linux.org.uk header.i=@linux.org.uk header.a=rsa-sha256 header.s=zeniv-20220401 header.b=asov2CXA;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record)
 smtp.mailfrom=ftp.linux.org.uk (client-ip=2607:5300:60:148a::1;
 helo=zeniv-ca.linux.org.uk; envelope-from=viro@ftp.linux.org.uk;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=linux.org.uk header.i=@linux.org.uk header.a=rsa-sha256
 header.s=zeniv-20220401 header.b=asov2CXA; 
 dkim-atps=neutral
X-Greylist: delayed 1351 seconds by postgrey-1.36 at boromir;
 Wed, 18 May 2022 08:28:26 AEST
Received: from zeniv-ca.linux.org.uk (zeniv-ca.linux.org.uk
 [IPv6:2607:5300:60:148a::1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4L2rP63g2Nz3bbQ
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 18 May 2022 08:28:26 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=linux.org.uk; s=zeniv-20220401; h=Sender:In-Reply-To:Content-Type:
 MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=AqOwTe1WYDilo14XAd3xKHqdHGS/uTUyPBKfuE4y0GU=; b=asov2CXAoWleBDgblXMHkwDM03
 6tOIBvwyZ+ZOgZIst9Q7xbqMXazNnGiVmRD09yZK4GTD5dG2ZcxrJfQpiI0hqm2zuaZM8tSMslFE5
 mL+lLmYFvbfmXveMiaE4KPPVuGRZjFqUDnWv56JLkZT3Pk2GkhjwhcVBW3cTDgyxqsbVm9i9eOELH
 OUrs/PysJYtH+uotJPxbqcQ8UZRJDxohiwogO2OdfDYZcFRycs7ECvqN0+3sj1u6gatpn1+2spiyg
 Na7YqttJXM0vMI0s8gXqTvt29ycbf7pDLT/39REMfEU7xt5GFV8fyjPKZRjrErpFkTUWFngwBhYnf
 xZ4yI5ow==;
Received: from viro by zeniv-ca.linux.org.uk with local (Exim 4.94.2 #2 (Red
 Hat Linux)) id 1nr5K2-00Fqdf-FW; Tue, 17 May 2022 22:05:42 +0000
Date: Tue, 17 May 2022 22:05:42 +0000
From: Al Viro <viro@zeniv.linux.org.uk>
To: Christoph Hellwig <hch@lst.de>
Subject: Re: [PATCH] net: unexport csum_and_copy_{from,to}_user
Message-ID: <YoQcNkB6R/E3vf51@zeniv-ca.linux.org.uk>
References: <20220421070440.1282704-1-hch@lst.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220421070440.1282704-1-hch@lst.de>
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
Cc: netdev@vger.kernel.org, x86@kernel.org, linux-kernel@vger.kernel.org,
 linux-m68k@lists.linux-m68k.org, linux-alpha@vger.kernel.org,
 akpm@linux-foundation.org, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, Apr 21, 2022 at 09:04:40AM +0200, Christoph Hellwig wrote:
> csum_and_copy_from_user and csum_and_copy_to_user are exported by
> a few architectures, but not actually used in modular code.  Drop
> the exports.
> 
> Signed-off-by: Christoph Hellwig <hch@lst.de>

Acked-by: Al Viro <viro@zeniv.linux.org.uk>

Not sure which tree should it go through - Arnd's, perhaps?
