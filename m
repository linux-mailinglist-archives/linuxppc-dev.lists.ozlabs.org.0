Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E63C2F5C83
	for <lists+linuxppc-dev@lfdr.de>; Thu, 14 Jan 2021 09:36:40 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DGd2T61ffzDrf6
	for <lists+linuxppc-dev@lfdr.de>; Thu, 14 Jan 2021 19:36:33 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linaro.org (client-ip=2a00:1450:4864:20::32e;
 helo=mail-wm1-x32e.google.com; envelope-from=lee.jones@linaro.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=ZIGADg3B; dkim-atps=neutral
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com
 [IPv6:2a00:1450:4864:20::32e])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DGczW2jNRzDrVM
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 14 Jan 2021 19:33:56 +1100 (AEDT)
Received: by mail-wm1-x32e.google.com with SMTP id g10so3896426wmh.2
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 14 Jan 2021 00:33:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=GjeLGr4dGUje6MMvo6pIfAne61VxoEvoHdwrClfl8/s=;
 b=ZIGADg3BlaqD32ynUhvAKUHK36WggmBH+HgCus+Lt0OiuAae5RFKTAAdAUBLBkfKrY
 g9mCLwos3GLeOzEZCwhYZwr8T5fiAWm2JBAxzVNiTStafjzlYckMK2ml72RUD1geMllQ
 TC4hDVHt/O8I3ZmVeHGXt1O5WQbtt/JbiFBmQso//vGSagy4KDFQiNpFLKIWEZL1gEtU
 rgvHU8MtqxV21EHUgiCzhfSYfGoPkgsH0esb0o3x3F9ayqx2pdlhR+Ode/A4/hYpSf0j
 AnO7uTlxvNucWcVxTJhpnRX7DXNGWSrX8lPRCWwv6I8P7aSS+LVkhBxZp6+rLxq35MjL
 qO4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=GjeLGr4dGUje6MMvo6pIfAne61VxoEvoHdwrClfl8/s=;
 b=dP+43qXudiu1E3mXyfkMXR+jgLrn4tzXzr0gWuFaXj3AKfiTdFKLncXVr863QS2n5D
 sG+Ulezwnvc1HjsSk1biIz0xHoDeNumRRELg+fr8eDKGo6M62IqZ1zd3QBVefFPA+DcI
 eHKS0/AvKCvH8GaMl0Dxy+pxVYUIAtVjk2Tz2RQTODHRDg7vSklStacprEMz0nc/TOBe
 TdF1HEfVcCkcGrcnd5bEexBWgge24pmPOKmhOMmmBhHaqAcytgBeXuwkAUh6Ox4nEgCz
 XvAaqleKz0opu+GQE0ocC0hQAr/DBWodb7kDWSgyy3rL7Wp6lcEvyJZ4G6Y9H7oXzStu
 STVg==
X-Gm-Message-State: AOAM530zMK3MevjoVzkjVZNCyRGzW9nuZR8Im2CcQXRZQedanZ5Rd18w
 3HuJrQfD6jGRKiFghyAobmsOzg==
X-Google-Smtp-Source: ABdhPJw3p4X/u/75/T9prjNVjPSDyTRHFC+ksLZ/wQbHtHizclaVB59YVOGqKuRlDUU9mMmbgYlTNw==
X-Received: by 2002:a1c:2d6:: with SMTP id 205mr2866556wmc.60.1610613232251;
 Thu, 14 Jan 2021 00:33:52 -0800 (PST)
Received: from dell ([91.110.221.178])
 by smtp.gmail.com with ESMTPSA id b14sm8094410wrx.77.2021.01.14.00.33.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 14 Jan 2021 00:33:51 -0800 (PST)
Date: Thu, 14 Jan 2021 08:33:49 +0000
From: Lee Jones <lee.jones@linaro.org>
To: Jakub Kicinski <kuba@kernel.org>
Subject: Re: [PATCH v2 0/7] Rid W=1 warnings in Ethernet
Message-ID: <20210114083349.GI3975472@dell>
References: <20210113164123.1334116-1-lee.jones@linaro.org>
 <20210113183551.6551a6a2@kicinski-fedora-pc1c0hjn.dhcp.thefacebook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20210113183551.6551a6a2@kicinski-fedora-pc1c0hjn.dhcp.thefacebook.com>
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
Cc: Paul Durrant <paul@xen.org>, Kurt Kanzenbach <kurt@linutronix.de>,
 Alexei Starovoitov <ast@kernel.org>,
 "Gustavo A. R. Silva" <gustavoars@kernel.org>, Peter Cammaert <pc@denkart.be>,
 Paul Mackerras <paulus@samba.org>, Sukadev Bhattiprolu <sukadev@linux.ibm.com>,
 Wei Liu <wei.liu@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>,
 John Fastabend <john.fastabend@gmail.com>,
 Santiago Leon <santi_leon@yahoo.com>, xen-devel@lists.xenproject.org,
 Grygorii Strashko <grygorii.strashko@ti.com>,
 Thomas Falcon <tlfalcon@linux.vnet.ibm.com>,
 Jesper Dangaard Brouer <hawk@kernel.org>,
 Jens Osterkamp <Jens.Osterkamp@de.ibm.com>,
 Rusty Russell <rusty@rustcorp.com.au>, Daris A Nevil <dnevil@snmc.com>,
 Lijun Pan <ljp@linux.ibm.com>, Ivan Khoronzhuk <ivan.khoronzhuk@linaro.org>,
 Nicolas Pitre <nico@fluxnic.net>, Geoff Levand <geoff@infradead.org>,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 Erik Stahlman <erik@vt.edu>, John Allen <jallen@linux.vnet.ibm.com>,
 Utz Bacher <utz.bacher@de.ibm.com>, Dany Madden <drt@linux.ibm.com>,
 bpf@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 "David S. Miller" <davem@davemloft.net>, Russell King <rmk@arm.linux.org.uk>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, 13 Jan 2021, Jakub Kicinski wrote:

> On Wed, 13 Jan 2021 16:41:16 +0000 Lee Jones wrote:
> > Resending the stragglers again.                                                                                  
> > 
> > This set is part of a larger effort attempting to clean-up W=1                                                   
> > kernel builds, which are currently overwhelmingly riddled with                                                   
> > niggly little warnings.                                                                                          
> >                                                                                                                  
> > v2:                                                                                                              
> >  - Squashed IBM patches                                                                                      
> >  - Fixed real issue in SMSC
> >  - Added Andrew's Reviewed-by tags on remainder
> 
> Does not apply, please rebase on net-next/master.

These are based on Tuesday's next/master.

I just rebased them now with no issue.

What conflict are you seeing?

-- 
Lee Jones [李琼斯]
Senior Technical Lead - Developer Services
Linaro.org │ Open source software for Arm SoCs
Follow Linaro: Facebook | Twitter | Blog
