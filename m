Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id BD55742084E
	for <lists+linuxppc-dev@lfdr.de>; Mon,  4 Oct 2021 11:32:06 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HNFq84HZxz2yw1
	for <lists+linuxppc-dev@lfdr.de>; Mon,  4 Oct 2021 20:32:04 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=canonical.com header.i=@canonical.com header.a=rsa-sha256 header.s=20210705 header.b=cuwHg+6Z;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=canonical.com (client-ip=185.125.188.123;
 helo=smtp-relay-internal-1.canonical.com;
 envelope-from=krzysztof.kozlowski@canonical.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=canonical.com header.i=@canonical.com
 header.a=rsa-sha256 header.s=20210705 header.b=cuwHg+6Z; 
 dkim-atps=neutral
Received: from smtp-relay-internal-1.canonical.com
 (smtp-relay-internal-1.canonical.com [185.125.188.123])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HNFpQ1wfCz2xv8
 for <linuxppc-dev@lists.ozlabs.org>; Mon,  4 Oct 2021 20:31:25 +1100 (AEDT)
Received: from mail-lf1-f70.google.com (mail-lf1-f70.google.com
 [209.85.167.70])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id AF58E402C9
 for <linuxppc-dev@lists.ozlabs.org>; Mon,  4 Oct 2021 09:31:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
 s=20210705; t=1633339876;
 bh=BhMF861qRXxB8JicXlfyBxo5M67ugNaJYcXfYfJhwvs=;
 h=Subject:To:Cc:References:From:Message-ID:Date:MIME-Version:
 In-Reply-To:Content-Type;
 b=cuwHg+6Z1shynrECXcHZcjrFxIVBFI9kXZyYTXbU/JFPF2KAKVGDe6c0NycQXMWKG
 ZP9rdxeDVzdPKas0GLBWAPh9WbjqGgk9OBYH7HMpruCMdfAn7hfhTaxDnQQ4blLwiF
 D4z/2fsTAuTJejJRPD5fjTX3wbOgC+/QIzuaz8eU/O+/068lfJ0yGWVuW6PPNiLEhH
 FkfmKPPPmJW4sc7NHZNVCiyX2p+PCqa3kzEVT+SKllKusjqAyl7Gwvc+Fs16AOS/gf
 tztuKs8DNLT2IA2fIz+o30mJQ0rsNPDZhNSfmetGjvF/bSnX1ybdiTdpMfVPAs0l/O
 nEL06ay5n6baQ==
Received: by mail-lf1-f70.google.com with SMTP id
 z9-20020a0565120c0900b003fce36c1f74so13712501lfu.9
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 04 Oct 2021 02:31:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=BhMF861qRXxB8JicXlfyBxo5M67ugNaJYcXfYfJhwvs=;
 b=HH490YqAjq3lO65b015GvTzFOp862vjCeF07L3XeZYin55fqjjk+h2I8hmEuwoYX3H
 i+bzXavmeRVxzTDI5iJAs669FVmb4mP7k+sSozGamFveJSR9v8YcD9Xy+G70fQC6+ek3
 woMoNDuXWXJLJk/AamOVvmD9+ADyByg9z4wJ9Sul6z0RJC5rwkJoQRtq70r2+Rx26SsE
 pItVqmyzQmR6AXdDOzR3/6JaOfUGiEVQ5+fpe8SiE012bpZowDqGwnyXJcQTPtuwPx2j
 SsCCzGCQP9n1BoWT+FMNsXmLjUR3byJpXslmqCGTKMyk9YrE6sPe4s82dl6dwOeE+RXW
 +xJA==
X-Gm-Message-State: AOAM533DpwRAmOugLIOMr9Mc9nPjzTU2bHBk8IoAOd+FZj8FvGrMwPJG
 mPoAA9tXru4aR9f/BbFoXdfrGViP16OySj1n0wFFJCtwvg2iFcrsvnytzWtp3DOi1riqYLyVK49
 gtQUDji8wuyc+zoqtapnVls0XCexGGyH1wO2QV6VBpfU=
X-Received: by 2002:a05:6512:1052:: with SMTP id
 c18mr13061988lfb.223.1633339876184; 
 Mon, 04 Oct 2021 02:31:16 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzsF7MpTHnCy/j3g+hDSYlF5AGtBdgBEcCWhBbURgsQ+KvwKCwGBOZ9EeWYxDHnkw58Nm6QvQ==
X-Received: by 2002:a05:6512:1052:: with SMTP id
 c18mr13061970lfb.223.1633339875996; 
 Mon, 04 Oct 2021 02:31:15 -0700 (PDT)
Received: from [192.168.0.197] ([193.178.187.25])
 by smtp.gmail.com with ESMTPSA id s29sm1678179ljd.54.2021.10.04.02.31.15
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 04 Oct 2021 02:31:15 -0700 (PDT)
Subject: Re: [PATCH 1/5] dt-bindings: memory: fsl: convert ifc binding to yaml
 schema
To: Li Yang <leoyang.li@nxp.com>
References: <20211001000924.15421-1-leoyang.li@nxp.com>
 <20211001000924.15421-2-leoyang.li@nxp.com>
 <db751cb1-9107-3857-7576-644bde4c28e5@canonical.com>
 <CADRPPNROVBp_QB=6XEgk8WF5fnEPFTSko4Nn+mm8oLM3iGTuuw@mail.gmail.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Message-ID: <e42fa620-810b-fdcc-c827-602a14d10d97@canonical.com>
Date: Mon, 4 Oct 2021 11:31:14 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <CADRPPNROVBp_QB=6XEgk8WF5fnEPFTSko4Nn+mm8oLM3iGTuuw@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
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
Cc: "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 lkml <linux-kernel@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>,
 Shawn Guo <shawnguo@kernel.org>,
 "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE"
 <linux-arm-kernel@lists.infradead.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 01/10/2021 18:17, Li Yang wrote:
> On Fri, Oct 1, 2021 at 5:01 AM Krzysztof Kozlowski
> <krzysztof.kozlowski@canonical.com> wrote:
>>

(...)

>>> +
>>> +  interrupts:
>>> +    minItems: 1
>>> +    maxItems: 2
>>> +    description: |
>>> +      IFC may have one or two interrupts.  If two interrupt specifiers are
>>> +      present, the first is the "common" interrupt (CM_EVTER_STAT), and the
>>> +      second is the NAND interrupt (NAND_EVTER_STAT).  If there is only one,
>>> +      that interrupt reports both types of event.
>>> +
>>> +  little-endian:
>>> +    $ref: '/schemas/types.yaml#/definitions/flag'
>>
>> type: boolean
> 
> It will not have a true or false value, but only present or not.  Is
> the boolean type taking care of this too?

boolean is for a property which does not accept values and true/false
depends on its presence.
See:
Documentation/devicetree/bindings/phy/lantiq,vrx200-pcie-phy.yaml
Documentation/devicetree/bindings/thermal/qoriq-thermal.yaml


Best regards,
Krzysztof
