Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 424A61F8C1F
	for <lists+linuxppc-dev@lfdr.de>; Mon, 15 Jun 2020 03:42:33 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49lYx13hpbzDqSy
	for <lists+linuxppc-dev@lfdr.de>; Mon, 15 Jun 2020 11:42:29 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::141;
 helo=mail-il1-x141.google.com; envelope-from=oohall@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=btQDyFIt; dkim-atps=neutral
Received: from mail-il1-x141.google.com (mail-il1-x141.google.com
 [IPv6:2607:f8b0:4864:20::141])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49lYv56tJdzDqRk
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 15 Jun 2020 11:40:49 +1000 (AEST)
Received: by mail-il1-x141.google.com with SMTP id z2so13824265ilq.0
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 14 Jun 2020 18:40:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=e0R0VcS82iMwtgZz8mDW0AfEhPJWl21echQTG38Nq4A=;
 b=btQDyFItD/dzzYytZaJICxNL2j4kX8r/ybSZ7LZH7D6Cg9pfqseumhhy5dGaFcDKwL
 vC5ek3gz1NJPgcJAaQgroSmJdxB3FIdFdHp1UTleNI+UsMXDmg5lOJArN9D2dI5/k5lK
 NPxZSjIs2qtsY8gITxf566WCJUj/gOAxhywCjNJqLVsR5HvXdMYtShnylghafmW/DH8g
 6UkEz3gi0F8Sg4/4rKMJcYreUhrU7cv5U2t1IsRzfNC2G8/lYNJFF6Q7DXWMECv19n1n
 sJnHSC7c6r5dgNfiGCwRq4NHLtJhh8eqKjR6XwzgmeBy0k9+IoFvT3+um2XnDrB+iPtM
 pn4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=e0R0VcS82iMwtgZz8mDW0AfEhPJWl21echQTG38Nq4A=;
 b=Echvfy+ef2lHKHO6YdhS9I0wdxn2jwpVT7bOqTBhcisdJhbGmgmu4Lm5dz68yBaBOP
 hRoawEIgm2zjkpnFowzCXU2VFSEQXROn/VqrFZvqTqbfAztZZE5rCHdoHKA6/yIkECLS
 CXCOzneb1WlUULbI/keQLQwH9lyvjld3LEKsULpE0gPxaUGjwtqoepC4RLlOl/FDySam
 TBEnoJeaJ9v3CujwI6PdNLuGpDNs5RZGrfHXW2jtezqtgcgEUIf6V9RqTItuBkDh3sO6
 AiLE2VtIt3BZdOewuI6SA2kCw2qz1MGBMjHdnzo41GryMpvaMnLMTklKn5MNNnWdzler
 Q7oA==
X-Gm-Message-State: AOAM530yvftycz6hG5eF3mtDgSLVrS3VgxYtzeyHhxHycjWoXTbi1eT5
 +TD7srL5rJU1VLeToi7DVMxEz+8zLPLAKZNX2kk=
X-Google-Smtp-Source: ABdhPJyC5GjuCF51Z5GQ47Ise61BeRl68fQIj7IKVEa+S3q0RWKKAaQA5yK+8ufNhfFhpRmFIhI8YFVd1X+yYTrqHPM=
X-Received: by 2002:a92:da03:: with SMTP id z3mr24836292ilm.258.1592185246142; 
 Sun, 14 Jun 2020 18:40:46 -0700 (PDT)
MIME-Version: 1.0
References: <37af499e-2b8b-7e78-ed4b-0aaf711fcb38@csgroup.eu>
 <20200614233235.121432-1-gthelen@google.com>
In-Reply-To: <20200614233235.121432-1-gthelen@google.com>
From: "Oliver O'Halloran" <oohall@gmail.com>
Date: Mon, 15 Jun 2020 11:40:35 +1000
Message-ID: <CAOSf1CHjrFb3J6t0HQXQVVM-PEgAcaCADA8mcwYVi4mpq+f3Yw@mail.gmail.com>
Subject: Re: [PATCH v2] powerpc/powernv/pci: use ifdef to avoid dead code
To: Greg Thelen <gthelen@google.com>
Content-Type: text/plain; charset="UTF-8"
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
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Paul Mackerras <paulus@samba.org>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, Jun 15, 2020 at 9:33 AM Greg Thelen <gthelen@google.com> wrote:
>
> Commit dc3d8f85bb57 ("powerpc/powernv/pci: Re-work bus PE
> configuration") removed a couple pnv_ioda_setup_bus_dma() calls.  The
> only remaining calls are behind CONFIG_IOMMU_API.  Thus builds without
> CONFIG_IOMMU_API see:
>   arch/powerpc/platforms/powernv/pci-ioda.c:1888:13: error: 'pnv_ioda_setup_bus_dma' defined but not used
>
> Move pnv_ioda_setup_bus_dma() under CONFIG_IOMMU_API to avoid dead code.

Doh! Thanks for the fix.

Reviewed-by: Oliver O'Halloran <oohall@gmail.com>
