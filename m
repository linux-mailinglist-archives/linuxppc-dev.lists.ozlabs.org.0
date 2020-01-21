Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 941E91437F4
	for <lists+linuxppc-dev@lfdr.de>; Tue, 21 Jan 2020 08:59:37 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4821CW10JWzDqMN
	for <lists+linuxppc-dev@lfdr.de>; Tue, 21 Jan 2020 18:59:35 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::541;
 helo=mail-pg1-x541.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=MViYrRpM; dkim-atps=neutral
Received: from mail-pg1-x541.google.com (mail-pg1-x541.google.com
 [IPv6:2607:f8b0:4864:20::541])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48219k4ynTzDqMK;
 Tue, 21 Jan 2020 18:57:59 +1100 (AEDT)
Received: by mail-pg1-x541.google.com with SMTP id 4so1040155pgd.6;
 Mon, 20 Jan 2020 23:57:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:subject:to:cc:references:in-reply-to:mime-version
 :user-agent:message-id:content-transfer-encoding;
 bh=H6tfjBbMRiA+FOFmJQ8Ny9edO+CaGsTBvI9qCjJ1dU4=;
 b=MViYrRpMJkw044igVelct/A1ct+ODOsKF730u9w/LZAjWjM6nM089vWhUwpafzl5fT
 r+JLwZNajsWo+o91PZ1DM7gH4UKOsMDStTkzNqqKLlWD0KJGj9przvpzOC7mQFngLXFz
 817YxcMNlih0j8YX+x2ZkHCVWr8WAmzkZO5o/pKYGDbphw2R1vlKbPethKVOInD3r6uu
 2AgjgVZxeNHyRGcqZs248LsP4hGwJV0fhaeIM/8Skz0ACANr/bn2TUOzwsmRgF7zF1o7
 5adUjbm0emPLjHVLQki1BYKCHQ3VNT5LDWUI5zHbKQDfx2h+awkJhIMqCcEBIWQuSSwY
 +vNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:subject:to:cc:references:in-reply-to
 :mime-version:user-agent:message-id:content-transfer-encoding;
 bh=H6tfjBbMRiA+FOFmJQ8Ny9edO+CaGsTBvI9qCjJ1dU4=;
 b=UsDov2NuDEdpFoUK0VCbZgapVXoZfPemFjYEmXIpSpa2tmnwgJ5v+jdOe/m+HZndEv
 P+jKr+vcOJO9Umh47wsvxGAHn2AV18+j0fmRkqxdSBrwYWMfzOONei58+19tfnkJTa8A
 h0O4XkDHdCwLFCLTYCYdAe4Uaqqa7NyNMLYJgoFfj8UaW0LN70tRMzGIECJZEBftHwzJ
 ONydZc+J67LWz+WfHZG4wTMLxyi++hAHoZgXJdOwpkG2HTZ9ljwM0H1WXPZGA2N6dbVU
 wJZ0aVfrX2x6ctpSTdQXxoeOH4zdj7o0l5UUekgONf/3oBmGfuk5au72JN4BU85+Ry8g
 7UJg==
X-Gm-Message-State: APjAAAW0maL0YMhqrcwvZTOx8aXFqdoWra2agwJoOmZdoOKu2e4COddf
 gHunGT2+UVebr5TTLAfvndE=
X-Google-Smtp-Source: APXvYqxPDmoxdUxdGGW3fzI6k6bj7+91NB13hNxe1Ou+adHFYVFWCWNW2S/M/xT035fbWqEi6djU1g==
X-Received: by 2002:a63:1f16:: with SMTP id f22mr3957562pgf.2.1579593475987;
 Mon, 20 Jan 2020 23:57:55 -0800 (PST)
Received: from localhost (193-116-65-251.tpgi.com.au. [193.116.65.251])
 by smtp.gmail.com with ESMTPSA id h6sm24913090pfo.175.2020.01.20.23.57.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 20 Jan 2020 23:57:55 -0800 (PST)
Date: Tue, 21 Jan 2020 17:54:53 +1000
From: Nicholas Piggin <npiggin@gmail.com>
Subject: Re: [RFC PATCH] skiboot machine check handler
To: mahesh@linux.vnet.ibm.com
References: <20191211100118.544-1-npiggin@gmail.com>
 <20200116070304.hks6zfsqholfolal@in.ibm.com>
In-Reply-To: <20200116070304.hks6zfsqholfolal@in.ibm.com>
MIME-Version: 1.0
User-Agent: astroid/0.15.0 (https://github.com/astroidmail/astroid)
Message-Id: <1579593134.eyxah2cuhp.astroid@bobo.none>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
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
Cc: skiboot@lists.ozlabs.org, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Mahesh J Salgaonkar's on January 16, 2020 5:03 pm:
> On 2019-12-11 20:01:18 Wed, Nicholas Piggin wrote:
>> Provide facilities to decode machine checks into human readable
>> strings, with only sufficient information required to deal with
>> them sanely.
>>=20
>> The old machine check stuff was over engineered. The philosophy
>> here is that OPAL should correct anything it possibly can, what
>> it can't handle but the OS might be able to do something with
>> (e.g., uncorrected memory error or SLB multi-hit), it passes back
>> to Linux. Anything else, the OS doesn't care. It doesn't want a
>> huge struct of severities and levels and originators etc that it
>> can't do anything with -- just provide human readable strings
>> for what happened and what was done with it.
>>=20
>> A Linux driver for this will be able to cope with new processors.
>>=20
>> This also uses the same facility to decode machine checks in OPAL
>> boot.
>>=20
>> The code is a bit in flux because it's sitting on top of a few
>> other RFC patches and not quite complete, just wanted opinions
>> about it.
>=20
> opal_handle_mce() may have to be treated as special opal call. For MCE
> that occurs in OPAL context, Linux making opal call will clobber
> original opal call stack which hit MCE. Same is true with nested MCE in
> OPAL. Should it just continue using same r1 to avoid clobbering or have
> a separate stack for mce opal call ?

Ah, it wasn't clear in my message, sorry: this would only be made
available to kernels which use the new calling convention where the
kernel provides its own stack for OPAL to use.

That may be controversial itself, that's another RFC but if we went
ahead with that approach, then handling re-entrant interrupts like
this becomes easy because Linux does all the hard work with NMI/MCE
stacks etc.

Thanks,
Nick
=
