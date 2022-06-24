Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id AE58B55A45F
	for <lists+linuxppc-dev@lfdr.de>; Sat, 25 Jun 2022 00:29:10 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LVBcN4yBmz3cgM
	for <lists+linuxppc-dev@lfdr.de>; Sat, 25 Jun 2022 08:29:08 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=Bgx80xNd;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::22f; helo=mail-lj1-x22f.google.com; envelope-from=fancer.lancer@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=Bgx80xNd;
	dkim-atps=neutral
Received: from mail-lj1-x22f.google.com (mail-lj1-x22f.google.com [IPv6:2a00:1450:4864:20::22f])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LVBbj6VvJz3bqd
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 25 Jun 2022 08:28:31 +1000 (AEST)
Received: by mail-lj1-x22f.google.com with SMTP id j22so4356212ljg.0
        for <linuxppc-dev@lists.ozlabs.org>; Fri, 24 Jun 2022 15:28:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=M6TdAKBeetFQMmcnXoWXDBN9CpxYrPuj3DRX2P2Szoo=;
        b=Bgx80xNdrOeU9JzOMlCo3jmGu3eQEekyMqjaaQaYKMst/DnrKcGb0EE1upc7kKT8P4
         K54FHhsRXWGYw/bc1J8YMZjeG/8AiSgtYmwnI6mfwkpdX3qvy9niezyBABlqVlTdDv03
         SA+kUOtNjI2FmmvlsZORBRGSAkWAETIKpgqcYPA5tGdwxtl10+UD0RHwwxbFI3oVsb8c
         liFraUMYDWhxgIHIm7mhId9Ea+cmAHr8yUX5fRN0NMwOQNKBipnBwBpuM10qkVNClQKS
         oDA3vxhA6o1tuWr+qxufLUEBgxvZ5J1mdjVi5AQATam+lJabiaASH8u48UBhCA164Kip
         pjkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=M6TdAKBeetFQMmcnXoWXDBN9CpxYrPuj3DRX2P2Szoo=;
        b=3Rlg2//Y95II1088q0z9B4VMnznXFFlIPOLR+XERSTI89PfZQFdiXZ1uMZ/+F5uC+k
         ga3NyKjOZaXt6H22IMs6y5cVGG6atbCe80PJl7EL6YG4m1y4DopLNkWHw4rRoY8+wzNY
         fSVJNEiGKtEHWMd1fem2tByuMNT6swupmn0yzdNAfXIoQ5k3ZWTRwWbxzWc5ntv9Urmz
         Jipz09LVDUa+TlhkYT7gjo2zVPRjZYqlpYcxJL3kAp2Q4Vi0DVAgC8z9DKhM0zR8iRp7
         m7PyIQs6jzY9cPKauK7INrzHTiEDBiTv/U0r+LyapFoRslie7qLYT1zkQ4WJo/Ox7K9I
         fLxA==
X-Gm-Message-State: AJIora9F6F5tLG27z/5zwHM85maRKQc0HL7VRk62hJKoDQOjdaqRPdvy
	WfveaSd7B3Hy5VOYB84kJHY=
X-Google-Smtp-Source: AGRyM1ve4VS6aD8h/ThKo8NNZipID8rOImhCMDMlHauNTgrARt80UIm1/HNQbY9Ll1kMIrgffG9rkQ==
X-Received: by 2002:a2e:91c4:0:b0:25a:7256:a7aa with SMTP id u4-20020a2e91c4000000b0025a7256a7aamr559661ljg.344.1656109704289;
        Fri, 24 Jun 2022 15:28:24 -0700 (PDT)
Received: from mobilestation ([95.79.189.214])
        by smtp.gmail.com with ESMTPSA id o23-20020a05651205d700b0047f62762100sm553545lfo.138.2022.06.24.15.28.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Jun 2022 15:28:23 -0700 (PDT)
Date: Sat, 25 Jun 2022 01:28:21 +0300
From: Serge Semin <fancer.lancer@gmail.com>
To: Vineet Gupta <vgupta@kernel.org>
Subject: Re: [PATCH RESEND v9 1/5] arc: dts: Harmonize EHCI/OHCI DT nodes name
Message-ID: <20220624222821.552zhh5yqqhdzmca@mobilestation>
References: <20220624141622.7149-1-Sergey.Semin@baikalelectronics.ru>
 <20220624141622.7149-2-Sergey.Semin@baikalelectronics.ru>
 <53402d57-ee3f-59b9-a8dc-59fa659f3662@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <53402d57-ee3f-59b9-a8dc-59fa659f3662@kernel.org>
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
Cc: Bjorn Andersson <bjorn.andersson@linaro.org>, Paul Mackerras <paulus@samba.org>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Rob Herring <robh@kernel.org>, Khuong Dinh <khuong@os.amperecomputing.com>, Alexey Brodkin <abrodkin@synopsys.com>, Krzysztof Kozlowski <krzk@kernel.org>, Andy Gross <agross@kernel.org>, linux-snps-arc@lists.infradead.org, devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org, Vladimir Zapolskiy <vz@mleia.com>, Rob Herring <robh+dt@kernel.org>, linux-arm-kernel@lists.infradead.org, Felipe Balbi <balbi@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-usb@vger.kernel.org, Patrice Chotard <patrice.chotard@st.com>, linux-kernel@vger.kernel.org, Serge Semin <Sergey.Semin@baikalelectronics.ru>, Vineet Gupta <vgupta@synopsys.com>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, Jun 24, 2022 at 03:11:43PM -0700, Vineet Gupta wrote:
> 
> On 6/24/22 07:16, Serge Semin wrote:
> > In accordance with the Generic EHCI/OHCI bindings the corresponding node
> > name is suppose to comply with the Generic USB HCD DT schema, which
> > requires the USB nodes to have the name acceptable by the regexp:
> > "^usb(@.*)?"  . Make sure the "generic-ehci" and "generic-ohci"-compatible
> > nodes are correctly named.
> > 
> > Signed-off-by: Serge Semin<Sergey.Semin@baikalelectronics.ru>
> > Acked-by: Alexey Brodkin<abrodkin@synopsys.com>
> > Acked-by: Krzysztof Kozlowski<krzk@kernel.org>
> 

> This slipped thru cracks. Now on for-curr.

Great! Thanks.

-Sergey

> 
> Thx,
> -Vineet
