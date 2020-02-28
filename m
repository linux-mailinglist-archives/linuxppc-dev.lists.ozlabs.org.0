Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 15DED172E72
	for <lists+linuxppc-dev@lfdr.de>; Fri, 28 Feb 2020 02:58:44 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48TCPW3XH7zDr99
	for <lists+linuxppc-dev@lfdr.de>; Fri, 28 Feb 2020 12:58:39 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::442;
 helo=mail-pf1-x442.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=L3tajodh; dkim-atps=neutral
Received: from mail-pf1-x442.google.com (mail-pf1-x442.google.com
 [IPv6:2607:f8b0:4864:20::442])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48TCMf4vsZzDqq3
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 28 Feb 2020 12:57:00 +1100 (AEDT)
Received: by mail-pf1-x442.google.com with SMTP id n7so853348pfn.0
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 27 Feb 2020 17:57:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:subject:to:cc:references:in-reply-to:mime-version
 :user-agent:message-id:content-transfer-encoding;
 bh=YQSgs9cEyhskAmMZkNEv5Auv02oAAtowAUpcrDbqCKY=;
 b=L3tajodhF3WiOHSC35a8Gm60u2a+vVy7pbdlu8hScU4UDvhfaaiYES5/wEHaiWp5Jg
 RTIZ9tYd2QJQYVsNa11NdF9W5x4A/kpZWoVCfYBT4HaQyjICi6TJnqhvQtAdRHSByMH9
 ucX7Mn/yLPSXhgQFLA9G+S8RDTRd6OfS2ShRB4gDA5ZrETy1RDGYxqB+gwbHHhCJfVxd
 J2GjVVZ1jP5tNYXeWtc86i4wikXx/uZ9J5oVv3HOVBGjYecKaTH2loEV/C5msTnMCqcl
 iepAVqBSM6AaEb1AEgyyrrvyXvHK5bXAi4R6IbS4ZNHOckdHsqUWX0S+k4mk506DMyuF
 zo0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:subject:to:cc:references:in-reply-to
 :mime-version:user-agent:message-id:content-transfer-encoding;
 bh=YQSgs9cEyhskAmMZkNEv5Auv02oAAtowAUpcrDbqCKY=;
 b=IxTL4heXNUMpQv+oDBT2+UJGfzLQQkxYthAHJpfHUuU9nPVzl6JofpvS4cVC8w9XnG
 i6IgVojBUYhtxMQjJWGW2USRhjwIrvaJe4QzoIp9z/FZMCov4yrUFVkSo8NLh9JeK9X8
 Ztkue9iz8eUS4blvG6ZjMC1PVMx6PYTlJYZGR1ylDnOOsS/0hXjCCaTpkCxSX6cSx67h
 KjxVw+mVrEjbCYSanvaeCkqaxvvZbbbQGzP0rztT8ay7Rf7OVQ7hjms1uGzN3ns+Hzf8
 TUhb5cGKQif6LA1Be1tYcswsHkuX5dIHYw5JjHEiMQQLKf4Ao5SzCU1XoDtW7WANlv1v
 lH+w==
X-Gm-Message-State: APjAAAXucVVhH0zEZ+FnGlSUOAI4gopenLsyHwzphMdhwYTeUZosFMzx
 +r5WlsVv8v4pBe66x9rGais=
X-Google-Smtp-Source: APXvYqwYj1vTeHpnmxydydQxDNkbL4waobSLkr51Z8Nunl4pt7dLvNLyAZAxxGzqdq8XoiEUa5F+Yw==
X-Received: by 2002:a63:ba05:: with SMTP id k5mr2141498pgf.174.1582855017320; 
 Thu, 27 Feb 2020 17:56:57 -0800 (PST)
Received: from localhost (193-116-109-34.tpgi.com.au. [193.116.109.34])
 by smtp.gmail.com with ESMTPSA id q11sm8673203pff.111.2020.02.27.17.56.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 27 Feb 2020 17:56:56 -0800 (PST)
Date: Fri, 28 Feb 2020 11:56:11 +1000
From: Nicholas Piggin <npiggin@gmail.com>
Subject: Re: [PATCH v3 11/14] powerpc/kprobes: Support kprobes on prefixed
 instructions
To: Jordan Niethe <jniethe5@gmail.com>
References: <20200226040716.32395-1-jniethe5@gmail.com>
 <20200226040716.32395-12-jniethe5@gmail.com>
 <1582700856.cbydlhx2wj.astroid@bobo.none>
 <CACzsE9r+dKAgmTPsWtzPTnjmVskG_BO5G3=0V_Qm_6pu-_ZRFg@mail.gmail.com>
 <1582853017.uien0qdstw.astroid@bobo.none>
In-Reply-To: <1582853017.uien0qdstw.astroid@bobo.none>
MIME-Version: 1.0
User-Agent: astroid/0.15.0 (https://github.com/astroidmail/astroid)
Message-Id: <1582854931.5fyab2tq33.astroid@bobo.none>
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
Cc: Alistair Popple <alistair@popple.id.au>, Daniel Axtens <dja@axtens.net>,
 linuxppc-dev@lists.ozlabs.org, Balamuruhan S <bala24@linux.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Nicholas Piggin's on February 28, 2020 11:47 am:
> Jordan Niethe's on February 27, 2020 10:58 am:
>> On Wed, Feb 26, 2020 at 6:18 PM Nicholas Piggin <npiggin@gmail.com> wrot=
e:
>> +
>> +#define DEREF_PPC_INST_PTR(ptr)                \
>> +({                            \
>> +    ppc_inst __inst;                \
>> +    __inst.w =3D *(unsigned int *)(ptr);        \
>> +    if (PPC_INST_IS_PREFIXED(__inst))        \
>> +        __inst.p =3D *(ppc_prefixed_inst *)(ptr);    \
>> +    __inst;                        \
>> +})
>=20
> I'd go an inline with shorter lowercase names. ppc_inst_read(&inst);

Probably inst =3D ppc_inst_read(mem), rather.

Thanks,
Nick
=
