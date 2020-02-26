Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id EAFC21707E9
	for <lists+linuxppc-dev@lfdr.de>; Wed, 26 Feb 2020 19:44:41 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48SPq95v2JzDqlZ
	for <lists+linuxppc-dev@lfdr.de>; Thu, 27 Feb 2020 05:44:37 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=209.85.128.66; helo=mail-wm1-f66.google.com;
 envelope-from=mstsxfx@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=fail (p=none dis=none) header.from=kernel.org
Received: from mail-wm1-f66.google.com (mail-wm1-f66.google.com
 [209.85.128.66])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48SPm75gx0zDqZT
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 27 Feb 2020 05:41:59 +1100 (AEDT)
Received: by mail-wm1-f66.google.com with SMTP id z12so369431wmi.4
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 26 Feb 2020 10:41:59 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=wgiZ1ng+EHQCRGEhYXEQoZQ67xno4JfWUO2p/Jhkjg0=;
 b=M0n1ym/mqs6oLt+0bRrAJCpccWOys8MwFmNmJ4zvgpUWsT9g3H+O5cxK7NWePnzcIn
 iiijfy1uqJITBXPI9OQk09A9AtQiYAL7EqQsX7+pnJpmPzYn9uYQL4Np2swCSvzo2UYS
 V9dnz1leCs/fWjhfzCz+QKhshG1DgGDvqVCvvvZi4wSVYnzbruNGBMd96ceM18QDR5fr
 jILHPmSdNIoVXjqHOP47yerKXQIFJnFB1MNwXhxbefuRrP3dsUbLoMrgbPak7uKHF0Ev
 nEQNws2OPa8xu8k58QRgBOnOZ4nL1vB2dKd+gzCgfFNW4v4Q/5IVX4pN6a9I2ck8sTxK
 3xhw==
X-Gm-Message-State: APjAAAV47VWxMMBWPC1DCI8UNu3dnfDGdcCD+jxzk7EbXsyh9fpwbbts
 j52bYwTOxsfnjK9bqcsvDAI=
X-Google-Smtp-Source: APXvYqwuw36jus9Ar7ixop4LA8bXmICEPCDIDDxHUl3/gyhnkSyoVJV/RDfl7iA236b+UdMJ2aBtuw==
X-Received: by 2002:a1c:dd87:: with SMTP id u129mr217096wmg.111.1582742514271; 
 Wed, 26 Feb 2020 10:41:54 -0800 (PST)
Received: from localhost (ip-37-188-190-100.eurotel.cz. [37.188.190.100])
 by smtp.gmail.com with ESMTPSA id j11sm4003459wmi.3.2020.02.26.10.41.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 26 Feb 2020 10:41:53 -0800 (PST)
Date: Wed, 26 Feb 2020 19:41:52 +0100
From: Michal Hocko <mhocko@kernel.org>
To: Christopher Lameter <cl@linux.com>
Subject: Re: [5.6.0-rc2-next-20200218/powerpc] Boot failure on POWER9
Message-ID: <20200226184152.GQ3771@dhcp22.suse.cz>
References: <0ba2a3c6-6593-2cee-1cef-983cd75f920f@virtuozzo.com>
 <F5A68B0C-AFDE-4C45-B0F3-12A5154204E6@linux.vnet.ibm.com>
 <20200218115525.GD4151@dhcp22.suse.cz>
 <D6F45EDD-9F2E-4593-B630-55E5BD7DE915@linux.vnet.ibm.com>
 <20200218142620.GF4151@dhcp22.suse.cz>
 <35EE65CF-40E3-4870-AEBC-D326977176DA@linux.vnet.ibm.com>
 <20200218152441.GH4151@dhcp22.suse.cz>
 <alpine.DEB.2.21.2002220337030.2000@www.lameter.com>
 <20200224085812.GB22443@dhcp22.suse.cz>
 <alpine.DEB.2.21.2002261823270.8012@www.lameter.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <alpine.DEB.2.21.2002261823270.8012@www.lameter.com>
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
Cc: Sachin Sant <sachinp@linux.vnet.ibm.com>, Pekka Enberg <penberg@kernel.org>,
 Kirill Tkhai <ktkhai@virtuozzo.com>,
 Linux-Next Mailing List <linux-next@vger.kernel.org>,
 David Rientjes <rientjes@google.com>, Joonsoo Kim <iamjoonsoo.kim@lge.com>,
 linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed 26-02-20 18:25:28, Cristopher Lameter wrote:
> On Mon, 24 Feb 2020, Michal Hocko wrote:
> 
> > Hmm, nasty. Is there any reason why kmalloc_node behaves differently
> > from the page allocator?
> 
> The page allocator will do the same thing if you pass GFP_THISNODE and
> insist on allocating memory from a node that does not exist.

I do not think that the page allocator would blow up even with
GFP_THISNODE. The allocation would just fail on memory less node.

Besides that kmalloc_node shouldn't really have an implicit GFP_THISNODE
semantic right? At least I do not see anything like that documented
anywhere.

-- 
Michal Hocko
SUSE Labs
