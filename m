Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 58FDB591C3D
	for <lists+linuxppc-dev@lfdr.de>; Sat, 13 Aug 2022 20:17:11 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4M4pfY2LNVz3c38
	for <lists+linuxppc-dev@lfdr.de>; Sun, 14 Aug 2022 04:17:09 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=209.85.216.49; helo=mail-pj1-f49.google.com; envelope-from=kswilczynski@gmail.com; receiver=<UNKNOWN>)
Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com [209.85.216.49])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4M4pf46Rsnz2xH3
	for <linuxppc-dev@lists.ozlabs.org>; Sun, 14 Aug 2022 04:16:42 +1000 (AEST)
Received: by mail-pj1-f49.google.com with SMTP id p14-20020a17090a74ce00b001f4d04492faso3545041pjl.4
        for <linuxppc-dev@lists.ozlabs.org>; Sat, 13 Aug 2022 11:16:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc;
        bh=AmRTB/8gR2ig8PJCGq+w2ZIymDcFBpWMH5rqLXrLQn4=;
        b=CCMU9NHnHSpgXg63UR2rMs+nw8p3pCOlUvkUNoKRjJUW1IHVgIJMKBJp07R08k56Hj
         lL2Qr1JjPlXVHYdlsLILPPBcxKjdQymqCQ6OVKnNQaG40HzA6YC0q62YK9tdicikWiDy
         djBjuiEF8c3cFAyNKthCQZiFscTfNR56yiLq/dBtNPJ1+H75dLPMOMBI0a03E3devkXA
         Wxsk2e8MkmX72GjfQgSZZjjhdHxEg52vqUGDT92QLCPZKo1MBxjtqhICBERmtx3uB1nj
         oYfnQr9zb6V6qnqa0L0ik2o+uDEeGozq78BCWGLCvg1ojZjFc9SeGefdDyQxm4N+kqGN
         DVGw==
X-Gm-Message-State: ACgBeo1rIQTQUt9iS+Jv9V6X8c9je4/4ParvP4BBjbTkohHPucocOfHm
	BAd9UNa/vUT0vaBoffhVoG4=
X-Google-Smtp-Source: AA6agR5wQaJRK0e7xQm9qfm5QxyEBBSxIl2hjDwXZPh/g0UE2k/bZWhgmYX7mgkf4jyndvNnGQFXOg==
X-Received: by 2002:a17:90a:b007:b0:1f1:d31e:4914 with SMTP id x7-20020a17090ab00700b001f1d31e4914mr19876174pjq.36.1660414599266;
        Sat, 13 Aug 2022 11:16:39 -0700 (PDT)
Received: from rocinante (fpd11144dd.ap.nuro.jp. [209.17.68.221])
        by smtp.gmail.com with ESMTPSA id t7-20020a634607000000b0041b5b929664sm3250038pga.24.2022.08.13.11.16.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 13 Aug 2022 11:16:38 -0700 (PDT)
Date: Sun, 14 Aug 2022 03:16:33 +0900
From: Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>
To: Zhuo Chen <chenzhuo.1@bytedance.com>
Subject: Re: [PATCH v4] PCI/ERR: Use pcie_aer_is_native() to judge whether OS
 owns AER
Message-ID: <YvfqgWB9h+7Xj1tH@rocinante>
References: <20220802040830.28514-1-chenzhuo.1@bytedance.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20220802040830.28514-1-chenzhuo.1@bytedance.com>
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
Cc: sathyanarayanan.kuppuswamy@linux.intel.com, jan.kiszka@siemens.com, stuart.w.hayes@gmail.com, linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org, lukas@wunner.de, oohall@gmail.com, bhelgaas@google.com, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hello Zhuo,

> Use pcie_aer_is_native() in place of "host->native_aer ||
> pcie_ports_native" to judge whether OS has native control of AER
> in aer_root_reset() and pcie_do_recovery().
> 
> Replace "dev->aer_cap && (pcie_ports_native || host->native_aer)" in
> get_port_device_capability() with pcie_aer_is_native(), which has no
> functional changes.
> 
> Signed-off-by: Zhuo Chen <chenzhuo.1@bytedance.com>
> ---
> Changelog:
> v4:
> - Use pcie_aer_is_native() instead in aer_root_reset().
> v3:
> - Simplify why we use pcie_aer_is_native().
> - Revert modification of pci_aer_clear_nonfatal_status() and comments.
> v2:
> - Add details and note in commit log.
[...]

A similar change has been proposed in the past, and back then, Bjorn had
a few questions and concerns.  Have a look at the entire discussion:

  https://lore.kernel.org/linux-pci/1612490648-44817-1-git-send-email-tanxiaofei@huawei.com/

If you think that the proposed changes are fine and can address some of
Bjorn's concerns, then it would be great.

Thank you in advance!

	Krzysztof
