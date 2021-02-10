Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id DA152316C5B
	for <lists+linuxppc-dev@lfdr.de>; Wed, 10 Feb 2021 18:17:36 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DbRK71TDmzDvbn
	for <lists+linuxppc-dev@lfdr.de>; Thu, 11 Feb 2021 04:17:31 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=209.85.167.177;
 helo=mail-oi1-f177.google.com; envelope-from=robherring2@gmail.com;
 receiver=<UNKNOWN>)
Received: from mail-oi1-f177.google.com (mail-oi1-f177.google.com
 [209.85.167.177])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DbRGL0GlnzDvYb
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 11 Feb 2021 04:15:05 +1100 (AEDT)
Received: by mail-oi1-f177.google.com with SMTP id l19so2825479oih.6
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 10 Feb 2021 09:15:05 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=qJ1RPXH4Ky3rknP1i83/kgXLfXXCz/TwgTUNKoCqZ64=;
 b=jE7IcJYXWD6rqkNZ2YMEdCOHXcbnMRAPpGZbjwGCRUORa82c0GtIqzEHY62cmpSNyw
 QQP/Z1hA5zx1eTMGuBvpQnrtYc5g7QvNLtr9hv3chLqeEbTE6nu82cvLjXO/fY3ckLv3
 gnUMsCypK7ul22+IOGl9+IA645vf1+b5ZIEd/SsC0CXlhW8fe36JAD67vt06onDBzh9S
 STqtYo5ohRNJLdNCltWZeT53pCOnWh3GvCN0mxV9gOVYNUTgf0R1RiHg243czsSCaO2n
 hUr0wZr0jPEC74YxyvSMy9gJanou1g2tXkAh2Ruw3TsqWy8PWdTC5xm5q0XmukXDu/Pz
 5E0g==
X-Gm-Message-State: AOAM530VgOHj41uC1iayCi2WfgmA5lxzXKlLi9CNXgRPk7jpkpTUvfqY
 +GLKvPwyzD8Rs/AheJYqTA==
X-Google-Smtp-Source: ABdhPJzsuQvHnbVMCnXzigZFYvy1mjydqefuslXLM2227BCJ57eYbmrcMRouWbgxLWOcD8sgwjoLFw==
X-Received: by 2002:a54:4803:: with SMTP id j3mr2257771oij.124.1612977302768; 
 Wed, 10 Feb 2021 09:15:02 -0800 (PST)
Received: from robh.at.kernel.org (24-155-109-49.dyn.grandenetworks.net.
 [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id u126sm567339oig.55.2021.02.10.09.15.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 10 Feb 2021 09:15:02 -0800 (PST)
Received: (nullmailer pid 2360939 invoked by uid 1000);
 Wed, 10 Feb 2021 17:15:00 -0000
Date: Wed, 10 Feb 2021 11:15:00 -0600
From: Rob Herring <robh@kernel.org>
To: Lakshmi Ramasubramanian <nramas@linux.microsoft.com>
Subject: Re: [PATCH v17 00/10] Carry forward IMA measurement log on kexec on
 ARM64
Message-ID: <20210210171500.GA2328209@robh.at.kernel.org>
References: <20210209182200.30606-1-nramas@linux.microsoft.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210209182200.30606-1-nramas@linux.microsoft.com>
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
Cc: mark.rutland@arm.com, tao.li@vivo.com, zohar@linux.ibm.com,
 paulus@samba.org, vincenzo.frascino@arm.com, frowand.list@gmail.com,
 sashal@kernel.org, masahiroy@kernel.org, jmorris@namei.org,
 takahiro.akashi@linaro.org, linux-arm-kernel@lists.infradead.org,
 catalin.marinas@arm.com, serge@hallyn.com, devicetree@vger.kernel.org,
 pasha.tatashin@soleen.com, will@kernel.org, prsriva@linux.microsoft.com,
 hsinyi@chromium.org, allison@lohutok.net, christophe.leroy@c-s.fr,
 mbrugger@suse.com, balajib@linux.microsoft.com, dmitry.kasatkin@gmail.com,
 linux-kernel@vger.kernel.org, james.morse@arm.com, gregkh@linuxfoundation.org,
 joe@perches.com, linux-integrity@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, bauerman@linux.ibm.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, Feb 09, 2021 at 10:21:50AM -0800, Lakshmi Ramasubramanian wrote:
> On kexec file load Integrity Measurement Architecture (IMA) subsystem
> may verify the IMA signature of the kernel and initramfs, and measure
> it.  The command line parameters passed to the kernel in the kexec call
> may also be measured by IMA.  A remote attestation service can verify
> a TPM quote based on the TPM event log, the IMA measurement list, and
> the TPM PCR data.  This can be achieved only if the IMA measurement log
> is carried over from the current kernel to the next kernel across
> the kexec call.
> 
> powerpc already supports carrying forward the IMA measurement log on
> kexec.  This patch set adds support for carrying forward the IMA
> measurement log on kexec on ARM64.
> 
> This patch set moves the platform independent code defined for powerpc
> such that it can be reused for other platforms as well.  A chosen node
> "linux,ima-kexec-buffer" is added to the DTB for ARM64 to hold
> the address and the size of the memory reserved to carry
> the IMA measurement log.
> 
> This patch set has been tested for ARM64 platform using QEMU.
> I would like help from the community for testing this change on powerpc.
> Thanks.
> 
> This patch set is based on
> commit 96acc833dec8 ("ima: Free IMA measurement buffer after kexec syscall")
> in https://git.kernel.org/pub/scm/linux/kernel/git/zohar/linux-integrity.git
> "next-integrity" branch.

Is that a hard dependency still? Given this is now almost entirely 
deleting arch code and adding drivers/of/ code, I was going to apply it.

Rob
