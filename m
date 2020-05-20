Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 93F4E1DBAA8
	for <lists+linuxppc-dev@lfdr.de>; Wed, 20 May 2020 19:05:57 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49RzfV5tq1zDqXK
	for <lists+linuxppc-dev@lfdr.de>; Thu, 21 May 2020 03:05:54 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record)
 smtp.mailfrom=bombadil.srs.infradead.org (client-ip=2607:7c80:54:e::133;
 helo=bombadil.infradead.org;
 envelope-from=batv+9495f3cb3d3d1d0fc876+6114+infradead.org+hch@bombadil.srs.infradead.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=infradead.org header.i=@infradead.org
 header.a=rsa-sha256 header.s=bombadil.20170209 header.b=mFGJE3B/; 
 dkim-atps=neutral
Received: from bombadil.infradead.org (bombadil.infradead.org
 [IPv6:2607:7c80:54:e::133])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49RzZ62Pz9zDqPw
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 21 May 2020 03:02:04 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20170209; h=In-Reply-To:Content-Type:MIME-Version
 :References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=wKFuUlL7y/Hz3vNl2ArSrtbtHfVShgj63vVocK+vAT4=; b=mFGJE3B/bWr+OnkaK0M7OgjxVz
 wGGnFeNf+j/uHBys9ZDrrxgbINOWDtHhpS2HfeOtHJcmou1tqjHmTpEIpdCiNZdePR1tp03BecMJ0
 KTf2waZP87WxMoPBHf8tXVMtZhGXfsLoWEtU8rxQBitP8mWvtAhnjzrDuTsWNIDGtH5ITb+0/z5G8
 X6gx+BQ+6aQSQTMugFQDbL6YAb6gWqKMkMfoJ3iuTH8hjh1paZm2IBbibjPpmXB6C0oRRmxwQ3lZ/
 neobDsvt/oWDkXcKVM9Y+hHH0GX22YdvPDX2USArnwlumE5N1EBCLNolK6CQotjua6vhR/iOCFCb9
 auljKSPg==;
Received: from hch by bombadil.infradead.org with local (Exim 4.92.3 #3 (Red
 Hat Linux)) id 1jbS6R-0000C5-R2; Wed, 20 May 2020 17:01:59 +0000
Date: Wed, 20 May 2020 10:01:59 -0700
From: Christoph Hellwig <hch@infradead.org>
To: Vaibhav Jain <vaibhav@linux.ibm.com>
Subject: Re: [RESEND PATCH v7 2/5] seq_buf: Export seq_buf_printf() to
 external modules
Message-ID: <20200520170159.GA22544@infradead.org>
References: <20200519190058.257981-1-vaibhav@linux.ibm.com>
 <20200519190058.257981-3-vaibhav@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200519190058.257981-3-vaibhav@linux.ibm.com>
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
Cc: Cezary Rojewski <cezary.rojewski@intel.com>, linux-nvdimm@lists.01.org,
 linux-kernel@vger.kernel.org, Steven Rostedt <rostedt@goodmis.org>,
 Piotr Maziarz <piotrx.maziarz@linux.intel.com>, Borislav Petkov <bp@alien8.de>,
 "Aneesh Kumar K . V" <aneesh.kumar@linux.ibm.com>,
 linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

s/seq_buf: Export seq_buf_printf() to external modules/
  seq_buf: export seq_buf_printf/
