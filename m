Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DBAB2C880E
	for <lists+linuxppc-dev@lfdr.de>; Mon, 30 Nov 2020 16:34:12 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Cl8R52CsHzDqD8
	for <lists+linuxppc-dev@lfdr.de>; Tue,  1 Dec 2020 02:34:09 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=209.85.221.67; helo=mail-wr1-f67.google.com;
 envelope-from=kswilczynski@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linux.com
Received: from mail-wr1-f67.google.com (mail-wr1-f67.google.com
 [209.85.221.67])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Cl8M02nW7zDqXd
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  1 Dec 2020 02:30:36 +1100 (AEDT)
Received: by mail-wr1-f67.google.com with SMTP id 23so16756479wrc.8
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 30 Nov 2020 07:30:35 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=aYHHxJmw979e+wSJRiDQN73bZ6bHCfBL6+c7qQzjNRM=;
 b=bY938Ga6/Mgn4AaAd30NVlpPwi9AOG6sYArDVGcq+LNtq/JWCor54AUDyHvRUg72HL
 ofQISnJunUykrk3yKYsh7qP4PHYVNWYID4tQCo5zhs0ZPF4jWgg5eTOEytz2GBfCZauA
 S4yianTiXzKiHuG9nWXx8BND+EVpc+cWxMm/i8VKlshdN8Aetg8vILDzNw+UGVeiVe0O
 SFuk/BwwQQVKSbza5PikMfeVmb9gKg7mGnK4Yxvq5XFCOD6dt9fz9aThw0EQIUP0G07d
 wgubJjP7EDcNXqntpZb26wdqUJnvZ5VKbz6gwcZuYD6u1M+m+2R2LvjE3h/1nRrl3Gl6
 cn+w==
X-Gm-Message-State: AOAM5314hAMkn1ijc+vECgSPrMaJGxITRjOxT1J6WdOrrlOSelm0KK9c
 QKaqxIkC57VUp+Ob5Dcsik0=
X-Google-Smtp-Source: ABdhPJxDgu0JUhfBnd1JT0sM9EnLMunvMJmxP1ptyZLeuiHRBoyRMeT9fOud0TpT6HDh8Aw84e0fEg==
X-Received: by 2002:adf:9d49:: with SMTP id o9mr29398963wre.413.1606750230899; 
 Mon, 30 Nov 2020 07:30:30 -0800 (PST)
Received: from rocinante ([95.155.85.46])
 by smtp.gmail.com with ESMTPSA id k11sm27836582wrv.88.2020.11.30.07.30.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 30 Nov 2020 07:30:30 -0800 (PST)
Date: Mon, 30 Nov 2020 16:30:28 +0100
From: Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>
To: Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>
Subject: Re: [PATCH v6 1/5] PCI: Unify ECAM constants in native PCI Express
 drivers
Message-ID: <X8UQFER3uccborBf@rocinante>
References: <20201129230743.3006978-1-kw@linux.com>
 <20201129230743.3006978-2-kw@linux.com>
 <20201130110858.GB16758@e121166-lin.cambridge.arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20201130110858.GB16758@e121166-lin.cambridge.arm.com>
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
Cc: Heiko Stuebner <heiko@sntech.de>, Shawn Lin <shawn.lin@rock-chips.com>,
 Paul Mackerras <paulus@samba.org>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Jonathan Chocron <jonnyc@amazon.com>, Toan Le <toan@os.amperecomputing.com>,
 Will Deacon <will@kernel.org>, Rob Herring <robh@kernel.org>,
 Florian Fainelli <f.fainelli@gmail.com>,
 Michal Simek <michal.simek@xilinx.com>, linux-rockchip@lists.infradead.org,
 bcm-kernel-feedback-list@broadcom.com,
 Jonathan Derrick <jonathan.derrick@intel.com>, linux-pci@vger.kernel.org,
 Ray Jui <rjui@broadcom.com>, linux-rpi-kernel@lists.infradead.org,
 Jonathan Cameron <Jonathan.Cameron@huawei.com>,
 Bjorn Helgaas <bhelgaas@google.com>, linux-arm-kernel@lists.infradead.org,
 Scott Branden <sbranden@broadcom.com>, Zhou Wang <wangzhou1@hisilicon.com>,
 Robert Richter <rrichter@marvell.com>, linuxppc-dev@lists.ozlabs.org,
 Nicolas Saenz Julienne <nsaenzjulienne@suse.de>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi Lorenzo!

On 20-11-30 11:08:58, Lorenzo Pieralisi wrote:
[...]
> > Refactor pci_ecam_map_bus() function to use newly added constants so
> > that limits to the bus, device function and offset (now limited to 4K as
> > per the specification) are in place to prevent the defective or
> > malicious caller from supplying incorrect configuration offset and thus
> > targeting the wrong device when accessing extended configuration space.
> > This refactor also allows for the ".bus_shit" initialisers to be dropped
>                                           ^^^^
> 
> Nice typo, I'd fix it while applying it though if you don't mind ;-),
> no need to resend it.

Oh doh!  Apologies. :)

> Jokes aside, nice piece of work, thanks for that.
> 
> > when the user is not using a custom value as a default value will be
> > used as per the PCI Express Specification.
> > 
> > Suggested-by: Bjorn Helgaas <bhelgaas@google.com>
> > Signed-off-by: Krzysztof Wilczyński <kw@linux.com>
> 
> I think Bjorn's reviewed-by still stands so I will apply it.
[...]

Thank you!

Krzysztof
