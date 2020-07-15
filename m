Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 2DB872203B9
	for <lists+linuxppc-dev@lfdr.de>; Wed, 15 Jul 2020 06:24:56 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4B646Y2bybzDqZN
	for <lists+linuxppc-dev@lfdr.de>; Wed, 15 Jul 2020 14:24:53 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::d43;
 helo=mail-io1-xd43.google.com; envelope-from=oohall@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=GTN7Ezxo; dkim-atps=neutral
Received: from mail-io1-xd43.google.com (mail-io1-xd43.google.com
 [IPv6:2607:f8b0:4864:20::d43])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4B643F5jRhzDqgV
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 15 Jul 2020 14:22:00 +1000 (AEST)
Received: by mail-io1-xd43.google.com with SMTP id l17so830880iok.7
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 14 Jul 2020 21:22:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=bimttYsjSPtmr+EfFWTtnDly5ZqiWdfEb/KVmt3KrvE=;
 b=GTN7EzxoczkytAqQj9lpd3Gs373fUrWUHF7CzzHODs5lL70kgO259j/CD9LtDChgvM
 4OQn5mn5Wc4vQUlT8TghaKcAFwsebmYhmRwJOsRrEOIM7XNeWIcWzP6OdAWDrIUa1hlT
 BMpAHDQUfeAOeC/lzk1Hl4O4BpKp8jZCrRKbATrpOvkEMV32keLy3MRblbvEaJVLmXRe
 Ka1INLIYi3IMzATSd35yFdjVGLQgo1Mc8c64iVs6eHfxmraJrkzLQi8pKuo/aFprLe8x
 hysWjrxeiWtBVinCODhFBlSpEZNXiBCAhFYPMcucZ5qSgJNhi5c4yZr6Ckk3mG9r0kRK
 Fvyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=bimttYsjSPtmr+EfFWTtnDly5ZqiWdfEb/KVmt3KrvE=;
 b=ElCUJpxtEaHFVXjYpH7caGT4KNGc2g9H5jZb7GcU0ATP38gptXorc/Dl1zjGfDSL3d
 8sddmYgxMo4COzXiv52hvKiNVoOB9ryu3OT2SXQkpnmQZ+6lg9hSUd8HpvsiIHaCgalZ
 ghHjfEkRQYW+sFrGdB+lTCr/Tc9RiCcGNTboUdSNHvaTLCsb0RUEzHUvoYbf2ae+pzIR
 co4y/NXanRDikY93E+afjErdPgSLnNgN44bZNzX1rgdwV1ls2kDg6GZFEnlStnvEXRQL
 0lGcaNJf5QOCRGL5CAFSLk9BBlHRpdPsJbr8kn3NeiJAliajHFb++1aywAou4Y4x/5Bv
 +OFw==
X-Gm-Message-State: AOAM533vnExXtNOezr7Wstj7Y3H1ov8eEQ3MVYJq9oNeDZF2D9ptdgnT
 5iDh6/zDh6/fFsfhQOoio+qVM2U3p8hoU/9kFc2IvLH8Ta0=
X-Google-Smtp-Source: ABdhPJyG/2/I4HtEps7UVJQNCDengpbQPkNtte1fxdEKnzdGH+9AWQHyU2wr93G/xgZBU1ZyqRyvYEz23HmcA/co000=
X-Received: by 2002:a5d:8853:: with SMTP id t19mr8437827ios.73.1594786918912; 
 Tue, 14 Jul 2020 21:21:58 -0700 (PDT)
MIME-Version: 1.0
References: <20200710052340.737567-1-oohall@gmail.com>
 <20200710052340.737567-13-oohall@gmail.com>
 <ece39d29-6ab0-dcf4-0561-3c488c7921f9@ozlabs.ru>
In-Reply-To: <ece39d29-6ab0-dcf4-0561-3c488c7921f9@ozlabs.ru>
From: "Oliver O'Halloran" <oohall@gmail.com>
Date: Wed, 15 Jul 2020 14:21:47 +1000
Message-ID: <CAOSf1CGbDWFzuh5pD3CYayTXOFsw18E0kFn052xtxrdes_2_zw@mail.gmail.com>
Subject: Re: [PATCH 12/15] powerpc/powernv/sriov: De-indent setup and teardown
To: Alexey Kardashevskiy <aik@ozlabs.ru>
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
Cc: linuxppc-dev <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, Jul 15, 2020 at 2:00 PM Alexey Kardashevskiy <aik@ozlabs.ru> wrote:
>
>
> or we could just skip setting
>
> ppc_md.pcibios_sriov_enable = pnv_pcibios_sriov_enable;
>
> for uninteresting platforms in pnv_pci_init_ioda_phb().

I don't think so. ppc_md is per-platform, not per-PHB andw e still
have to deal with a mixture of IODA/NVLink/OpenCAPI PHBs on a single
system. We could make it a callback in pnv_phb, but  it seemed like
more indirection than it's worth.
