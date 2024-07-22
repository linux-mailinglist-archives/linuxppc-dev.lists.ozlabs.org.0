Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 50EFE9395AC
	for <lists+linuxppc-dev@lfdr.de>; Mon, 22 Jul 2024 23:47:23 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=purestorage.com header.i=@purestorage.com header.a=rsa-sha256 header.s=google2022 header.b=CI1GupzH;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WSYls1ZQZz3byP
	for <lists+linuxppc-dev@lfdr.de>; Tue, 23 Jul 2024 07:47:21 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=purestorage.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=purestorage.com header.i=@purestorage.com header.a=rsa-sha256 header.s=google2022 header.b=CI1GupzH;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=permerror (SPF Permanent Error: Void lookup limit of 2 exceeded) smtp.mailfrom=purestorage.com (client-ip=2a00:1450:4864:20::62b; helo=mail-ej1-x62b.google.com; envelope-from=mattc@purestorage.com; receiver=lists.ozlabs.org)
Received: from mail-ej1-x62b.google.com (mail-ej1-x62b.google.com [IPv6:2a00:1450:4864:20::62b])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WSVpd3DsFz3bTt
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 23 Jul 2024 05:34:31 +1000 (AEST)
Received: by mail-ej1-x62b.google.com with SMTP id a640c23a62f3a-a7a8553db90so649766b.2
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 22 Jul 2024 12:34:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=purestorage.com; s=google2022; t=1721676859; x=1722281659; darn=lists.ozlabs.org;
        h=references:in-reply-to:message-id:date:subject:cc:to:from:from:to
         :cc:subject:date:message-id:reply-to;
        bh=fi4bLVnPbCJMOh1UmYIW4CBHtEc9QZE9R0H9ArF/eWU=;
        b=CI1GupzHbxuESycJS1R0JgBI+9OEJWcDkdxwQLzi5lfx4+byK9pExxLDW0kSyQfdBO
         SkjHQP4CTHhQhzdVhqma92D4Z38hv6Di1KSizg6xt6nXNxo0QdSVmut2KlwXhuyAagYP
         qMcDxJqKoJ/JrDCd5UX0NkIvkGFLgqjeep2TK15M5ieoQnX+/5mZYHWklT6XBHFdFHIL
         mOJrmy7aDJszXZVFE65oc31ZrPScOlzSFufVFMmGoHuRz6rZ87+EzcQjlZzeea9U4FKT
         irV9757fuGkZvUYG4x0BTsh7tgO3uCsiPaHPYr8GQdgWOvsEs5/8m2RS9iw9M+3vP33X
         /Bxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721676859; x=1722281659;
        h=references:in-reply-to:message-id:date:subject:cc:to:from
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=fi4bLVnPbCJMOh1UmYIW4CBHtEc9QZE9R0H9ArF/eWU=;
        b=BeqWmduPZYOaN4xfu6NYiHSgRH0R1aHyMNASLuDbP7LgBIn7v5Z6iuu6Qn0pwroefI
         Ds0H62G5TEkdPKFGvIOftCMF9vyxZtxx2f+A0MKlWjniX1m1Hz/u+sHgiqwMKKLXn2To
         bcywHqfS1DVQmDNTw4wWQDMFLdh/K0uBZSuE6iDcqC5O9Xl6ezK/Yja4n+mqn8M7xLS+
         FtOVZFM/VdwFtZZ58VVescrGYxG+esEUu8NqqQvOeKtmT5zJDTm6p+6Ngor6cGhlaQBV
         u9le8dxNK3s+MZTmuT50tV8/4Pj+7kyxS+yeXrOOWZIR+tBP4TpZ4YXI1v8kB0KWeA5/
         q27w==
X-Forwarded-Encrypted: i=1; AJvYcCW0HCbYkk12iiTqces+dw16b2MKRqdmbmTU9pDU2DFKh2+MP30oFBEEM3PgvJ3ymckaXLA56kN2ltoeIgUR3gfQnNPuiwniE/C6SFrP4g==
X-Gm-Message-State: AOJu0YzD5xg7ekYb645C3yPS9dfk3jXbX+0eVAayYDYEnHh7lk2JRUnN
	kg4uP37yxJmYObRMsFd3OiE2YI1abs7qcHh1Fdtr4GsMV5W4ewhpabmyLv+6Hxg=
X-Google-Smtp-Source: AGHT+IH0MH/+8seIiuBJ3Gs3Am9JxoYK2yWY1TdfrT/Nm8KdeQf+5AlcM7dCujXTS86xp1i01YFyGw==
X-Received: by 2002:a17:907:3faa:b0:a72:7d5c:ace0 with SMTP id a640c23a62f3a-a7a4bfa341emr556636166b.11.1721676858606;
        Mon, 22 Jul 2024 12:34:18 -0700 (PDT)
Received: from dev-mattc2.dev.purestorage.com ([208.88.159.129])
        by smtp.googlemail.com with ESMTPSA id a640c23a62f3a-a7a3c7b66ecsm456836466b.51.2024.07.22.12.34.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Jul 2024 12:34:18 -0700 (PDT)
From: Matthew W Carlis <mattc@purestorage.com>
To: macro@orcam.me.uk
Subject: PCI: Work around PCIe link training failures
Date: Mon, 22 Jul 2024 13:34:07 -0600
Message-Id: <20240722193407.23255-1-mattc@purestorage.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <alpine.DEB.2.21.2306111619570.64925@angie.orcam.me.uk>
References: <alpine.DEB.2.21.2306111619570.64925@angie.orcam.me.uk>
X-Mailman-Approved-At: Tue, 23 Jul 2024 07:46:45 +1000
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
Cc: linux-pci@vger.kernel.org, mahesh@linux.ibm.com, edumazet@google.com, oohall@gmail.com, sr@denx.de, leon@kernel.org, linux-rdma@vger.kernel.org, christophe.leroy@csgroup.eu, kuba@kernel.org, pabeni@redhat.com, wilson@tuliptree.org, linuxppc-dev@lists.ozlabs.org, npiggin@gmail.com, alex.williamson@redhat.com, bhelgaas@google.com, mika.westerberg@linux.intel.com, david.abdurachmanov@gmail.com, saeedm@nvidia.com, linux-kernel@vger.kernel.org, lukas@wunner.de, netdev@vger.kernel.org, pali@kernel.org, davem@davemloft.net
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Sorry to resurrect this one, but I was wondering why the
PCI device ID in drivers/pci/quirks.c for the ASMedia ASM2824
isn't checked before forcing the link down to Gen1... We have
had to revert this patch during our kernel migration due to it
interacting poorly with at least one older Gen3 PLX PCIe switch
vendor/generation while using DPC. In another context we have
found similar issues during system bringup without DPC while
using a more legacy hot-plug model (BIOS defaults for us..).
In both contexts our devices are stuck at Gen1 after physical
hot-plug/insert, power-cycle.

Tried reading through the patch history/review but it was still
a little bit unclear to me. Can we add the device ID check as a
precondition to forcing link to Gen1?
