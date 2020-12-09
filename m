Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 265362D4CBF
	for <lists+linuxppc-dev@lfdr.de>; Wed,  9 Dec 2020 22:22:06 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CrqkM1czFzDqwV
	for <lists+linuxppc-dev@lfdr.de>; Thu, 10 Dec 2020 08:22:03 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::544;
 helo=mail-ed1-x544.google.com; envelope-from=olteanv@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=niQBzCOY; dkim-atps=neutral
Received: from mail-ed1-x544.google.com (mail-ed1-x544.google.com
 [IPv6:2a00:1450:4864:20::544])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CrqhS0vcDzDqsj
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 10 Dec 2020 08:20:23 +1100 (AEDT)
Received: by mail-ed1-x544.google.com with SMTP id k4so3195899edl.0
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 09 Dec 2020 13:20:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=dgu5SGKx1gsYdy9j4dOrYrsjFJDAyhP/ryB0BUE7zio=;
 b=niQBzCOYtIl/hSI517HSDdPqg8oTrgM3dfRFRWH3fUdOBclueW5rO1xnYYbVKxAInH
 isd9w2yJkKDLEZ98RuhEakRekizvzPuzsJDwX7wiyIXVzRK6heZVnpwz3PNrrgiaId4P
 d7/rpIN+kmbcLiN/07eSzUn+jYBO048TqSHvFhh9i+ZNZa6kFaa/gGCp8o+nbA4nomyV
 kW2pjY8jqBAzm74LjOd6HBS8uTK71WBhGWe+iH3j1SyaYnISaxA2NqA1CSOS2T32aTD1
 HEsX/+nKGrYwAl2l9I01Eh+mZV2kBGwrVFkvI8J6qi8sPp7/OM8Ec7kyiHqsMlJhgVKP
 KtVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=dgu5SGKx1gsYdy9j4dOrYrsjFJDAyhP/ryB0BUE7zio=;
 b=cBGwcJamlWBL/ydNZq2Q92z/yqJKLeCWxJ35Ekbn+3xkXBLW9dFlOtpHgCABz7gwpQ
 PZAKSvIR5Gimzp1BfEdOYKkOvWYaIFpMToquBzCEjYP3xq5950oC6tUQg4QKQpKnts2J
 4lYWCfQajNQuXjhVDDIN2EIkeaNvxKn59IWorBW5Jx8CEqGb7FGQJgLTc7qMQ2dtDWss
 3s7QhsMxqWMLauTdX0vuNbxmLfnpH92+WY1B4mvS9fsJ6yvP6U3Xxj2BcQs/oMwiUqdr
 YHdqkqpMUYM13paxnDcc/8RYIMOc30rW81+lfk/WkO2B1h2nMXDrnCRH+w46T+xyzVBZ
 7p4w==
X-Gm-Message-State: AOAM532dHyUlqcnPbLiVzkomwjpj8SqXkFb1G66Z+oWpN72/5t4FaoQK
 G4HxJHem1uTpXC1MGhm2kLM=
X-Google-Smtp-Source: ABdhPJznqu5V3gX6VcnRSs31xSg7oHWhdE8I8tSsQuFGa09jBY2GusA8WWIa3CyUu6L7fV1c5sghOg==
X-Received: by 2002:a05:6402:149a:: with SMTP id
 e26mr3491125edv.150.1607548820494; 
 Wed, 09 Dec 2020 13:20:20 -0800 (PST)
Received: from skbuf ([188.25.2.120])
 by smtp.gmail.com with ESMTPSA id mb15sm2561294ejb.9.2020.12.09.13.20.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 09 Dec 2020 13:20:19 -0800 (PST)
Date: Wed, 9 Dec 2020 23:20:17 +0200
From: Vladimir Oltean <olteanv@gmail.com>
To: Bjorn Helgaas <helgaas@kernel.org>
Subject: Re: [PATCH v6 0/5] PCI: Unify ECAM constants in native PCI Express
 drivers
Message-ID: <20201209212017.vx7dps3jasjcwg6j@skbuf>
References: <20201209202904.2juzokqhleusgsts@skbuf>
 <20201209205913.GA2543692@bjorn-Precision-5520>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201209205913.GA2543692@bjorn-Precision-5520>
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
Cc: kw@linux.com, heiko@sntech.de, shawn.lin@rock-chips.com,
 Alexandru Marginean <alexm.osslist@gmail.com>, paulus@samba.org,
 thomas.petazzoni@bootlin.com, jonnyc@amazon.com, toan@os.amperecomputing.com,
 will@kernel.org, robh@kernel.org, lorenzo.pieralisi@arm.com,
 michal.simek@xilinx.com, linux-rockchip@lists.infradead.org,
 bcm-kernel-feedback-list@broadcom.com, linux-arm-kernel@lists.infradead.org,
 linux-pci@vger.kernel.org, rjui@broadcom.com, f.fainelli@gmail.com,
 linux-rpi-kernel@lists.infradead.org, Jonathan.Cameron@huawei.com,
 bhelgaas@google.com, jonathan.derrick@intel.com, sbranden@broadcom.com,
 wangzhou1@hisilicon.com, Michael Walle <michael@walle.cc>,
 rrichter@marvell.com, linuxppc-dev@lists.ozlabs.org, nsaenzjulienne@suse.de
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, Dec 09, 2020 at 02:59:13PM -0600, Bjorn Helgaas wrote:
> Yep, that's the theory.  Thanks for testing it!

Testing what? I'm not following.
