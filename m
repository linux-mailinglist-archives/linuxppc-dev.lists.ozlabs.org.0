Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id DF0255608CA
	for <lists+linuxppc-dev@lfdr.de>; Wed, 29 Jun 2022 20:14:01 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LY8jg6LS1z3dQs
	for <lists+linuxppc-dev@lfdr.de>; Thu, 30 Jun 2022 04:13:59 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=WNrFF9D7;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linaro.org (client-ip=2a00:1450:4864:20::532; helo=mail-ed1-x532.google.com; envelope-from=krzysztof.kozlowski@linaro.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=WNrFF9D7;
	dkim-atps=neutral
Received: from mail-ed1-x532.google.com (mail-ed1-x532.google.com [IPv6:2a00:1450:4864:20::532])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LY8j16zDSz3bm8
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 30 Jun 2022 04:13:23 +1000 (AEST)
Received: by mail-ed1-x532.google.com with SMTP id e40so23361804eda.2
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 29 Jun 2022 11:13:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=NQV1i59mi4tYuil98CU1c0W6/nHmMnM5HHghJrHgau4=;
        b=WNrFF9D7t/NeKPR2o263ccrZ4Kz2RDLA8sOsIoouM761+1rrT4cof++hldliKQiACV
         hX3LySXE+ZSE33jC5CfHMcwYfym4jCLhPhtxseUmO7PgYE32cye9xBIOUfkh8pGoVVn2
         krpgMJIqN+nxTOwpLj81I/uVydhVfoX2aSdell54CqeaGcqlDF7JPRWUBeC3hljz4Mzd
         Ht+WZST6eV3cstYTNkXHep5D2gHL69WuPvHk2fRl1vThyAY5dF/d4mdQi0ISy7btrG2t
         vfUnzuE/CkJ9gA6SA9GS0tu5tEBmTYfo0nwwsAHxEmXl+mGMkzStu+7B4CnpxDDtoTEl
         UCTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=NQV1i59mi4tYuil98CU1c0W6/nHmMnM5HHghJrHgau4=;
        b=VmoAcPeZxAA16wzy3fd8I8RY+3RVq5jBR+dx84/74i9wAIBYXmotNlVNSM9N1t5+DT
         rJYoEQvNUcO6P0i26QMtxW70K0s+dBLNlEvzLzacWnU85gGjXYgqJ+PcbtsIuoSTgrNc
         p3ZieLrxvJj6hlZk7puyUWRr45WV0N5Ax1B32GjArHUJML4Q6C2clGrrlLqc0BJJX96j
         jHCtvoRsJDvb+eEepVB1N/JAJkr8xpBEww9ePza29ZFzm2X5qYdRfCBI6FHv6U/e0izP
         i+/H+zOWV65EfThsGYGVeY2SGoq15PkDTX6H0WjYIKpoYJhDdgfuXHIL95aBGRXRC6qV
         3clw==
X-Gm-Message-State: AJIora/dmpMajKVwKKkiOEe1fPovUn9h/KzDIxFxvp/aleayJmrXt+CA
	tlSIKLQoPw1nPQN4GLeRNM0ixA==
X-Google-Smtp-Source: AGRyM1vDnN5C5nuEB9Dh4LeQO94kOMTOgN6sZ3SPGH517QZb1tU5e/c3+vjlciBP8Wf5FDroAz1iKQ==
X-Received: by 2002:a05:6402:5384:b0:431:6d84:b451 with SMTP id ew4-20020a056402538400b004316d84b451mr5899111edb.46.1656526395107;
        Wed, 29 Jun 2022 11:13:15 -0700 (PDT)
Received: from [192.168.0.187] (xdsl-188-155-176-92.adslplus.ch. [188.155.176.92])
        by smtp.gmail.com with ESMTPSA id zm9-20020a170906994900b006fee7b5dff2sm8127702ejb.143.2022.06.29.11.13.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 29 Jun 2022 11:13:14 -0700 (PDT)
Message-ID: <908e7555-0090-84fe-4227-d6b349de1394@linaro.org>
Date: Wed, 29 Jun 2022 20:13:13 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH v3 02/12] powerpc: wiiu: device tree
Content-Language: en-US
To: Segher Boessenkool <segher@kernel.crashing.org>
References: <20220622131037.57604-1-ash@heyquark.com>
 <20220628133144.142185-1-ash@heyquark.com>
 <20220628133144.142185-3-ash@heyquark.com>
 <c760e444-57c3-0e1a-0e4d-f79d6ae9867a@linaro.org>
 <20220629161302.GG25951@gate.crashing.org>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220629161302.GG25951@gate.crashing.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
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
Cc: devicetree@vger.kernel.org, linkmauve@linkmauve.fr, linux-kernel@vger.kernel.org, rw-r-r-0644@protonmail.com, robh+dt@kernel.org, paulus@samba.org, Ash Logan <ash@heyquark.com>, krzysztof.kozlowski+dt@linaro.org, j.ne@posteo.net, linuxppc-dev@lists.ozlabs.org, joel@jms.id.au
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 29/06/2022 18:13, Segher Boessenkool wrote:
> On Wed, Jun 29, 2022 at 11:58:18AM +0200, Krzysztof Kozlowski wrote:
>> On 28/06/2022 15:31, Ash Logan wrote:
>>> +	model = "nintendo,wiiu";
>>
>> It's not compatible, but user-visible string, e.g. "Nintendo Wii U"
> 
> The "model" property in OF is documented as:
> 
> ---
> “model”                                                                S
> Standard property name to define a manufacturer’s model number.
> 
> prop-encoded-array:
>   Text string, encoded with encode-string.
> A manufacturer-dependent string that generally specifies the model name
> and number (including revision level) for this device. The format of the
> text string is arbitrary, although in conventional usage the string
> begins with the name of the device’s manufacturer as with the “name”
> property.
> Although there is no standard interpretation for the value of the
> “model” property, a specific device driver might use it to learn, for
> instance, the revision level of its particular device.
> 
> See also: property, model.
> 
> Used as: " XYZCO,1416-02" encode-string " model" property

Hm, surprising to duplicate the compatible, but OK.

> ---
> 
>>> +	cpus {
>>> +		#address-cells = <1>;
>>> +		#size-cells = <0>;
>>> +
>>> +		/* TODO: Add SMP */
>>> +		PowerPC,espresso@0 {
>>
>> Node name should be generic, so "cpu". Unless something needs the
>> specific node name?
> 
> This is how most other PowerPC firmwares do it.  The PowerPC processor
> binding is older than the generic naming practice, so CPU nodes have
> device_type "cpu" instead.  

ePAPR 1.0 from 2008 explicitly asks for generic node names. So 4 years
before Nintento Wii U. Maybe earlier ePAPR-s were also asking for this,
no clue, don't have them.

> This is a required property btw, with that
> value.  (There is no requirement on the names of the CPU nodes).

That's fine, I am not talking about property.

> There is no added value in generic naming for CPU nodes anyway, since
> you just find them as the children of the "/cpus" node :-)

There is because you might have there caches. It also makes code easier
to read.

Best regards,
Krzysztof
