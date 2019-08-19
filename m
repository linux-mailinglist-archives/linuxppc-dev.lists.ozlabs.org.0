Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 11DA19280C
	for <lists+linuxppc-dev@lfdr.de>; Mon, 19 Aug 2019 17:09:45 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46By5K4bBNzDqjH
	for <lists+linuxppc-dev@lfdr.de>; Tue, 20 Aug 2019 01:09:41 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::444; helo=mail-pf1-x444.google.com;
 envelope-from=npiggin@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="NpXsGGFi"; 
 dkim-atps=neutral
Received: from mail-pf1-x444.google.com (mail-pf1-x444.google.com
 [IPv6:2607:f8b0:4864:20::444])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46By0R533FzDqdc
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 20 Aug 2019 01:05:26 +1000 (AEST)
Received: by mail-pf1-x444.google.com with SMTP id v12so1318015pfn.10
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 19 Aug 2019 08:05:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:subject:to:cc:references:in-reply-to:mime-version
 :user-agent:message-id:content-transfer-encoding;
 bh=2ngrUcm028FTMoHPYwWl4FMwsMbOztEIs+R4QrrR4rw=;
 b=NpXsGGFiQO2Mz4ORGbsS+ZJTAE+cCEfnpxGV7ZTaS8n+cYKW15FoD17x/Vc1KyFmNH
 PIDSLvIRG58tREVOAavFge/cofdX4gzRNlE9naek5zb4a89f/kPIGIy+pPd2CIHMli5t
 dpBhGYbbkDTo9DANgDqNa8zKrZ+xio88LhvAWsdcdNQ20UWUef69za7EvrbIxDQBDFJo
 jgCu/ZofkAe9DVOZXGNT+y7gpEzMjQQcLgq5vhd7tjWe90JsZefALpQM9YTcVVYnD6A+
 y7czBeKXh0C3yG8IHs//zk6vWHoi0sMH22tCkTTXHpEI52Zy2pjgK8xTt4SCn9GtawsW
 7szg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:subject:to:cc:references:in-reply-to
 :mime-version:user-agent:message-id:content-transfer-encoding;
 bh=2ngrUcm028FTMoHPYwWl4FMwsMbOztEIs+R4QrrR4rw=;
 b=nNqxAHAe/C4vmdeXgPezj6RnPb3Ogq1g/SWCgI+pKWC0AbkcFDGQupm9GDVP8JwweC
 gfcShPCY8FdB38byq7Fgy1sQK59JX/EcT5tHqfFxMdSLIVkLe+laXd9rxeNrB42NZ9Jg
 a6vKhyi/BGmoBfAYUr+K8qblJcR/6chfttzboNIwb4tXALr/oAmfZH0TCSN0xvXy5bxg
 ruPYKYrXbxygET0d/tZxA+7mTptHDLb8RMCalhb8SyZAvaZecFLOz27t4gyosvjHMdM0
 UzVFWWVclOd8q/jx0GywKRIT7TRrXg45Ph7Ftniq5TyhgBwTXeXLoaN9BQl2+k3Uxu39
 ALfA==
X-Gm-Message-State: APjAAAUOUcK0yXRZDjv2zkbyppI/7oY5RhyTcg9wU2aAy16ML4gZ5S2I
 /tFv/zyUjHqOoGaw7nNvNoY=
X-Google-Smtp-Source: APXvYqzTv8DMd0Hto6oUfVfrBBvkkCqsCKUum+sxq+xdhkH6KnGHqImWBaBZF1x5ryJuEqdshOhwMQ==
X-Received: by 2002:a17:90a:bf82:: with SMTP id
 d2mr10680284pjs.121.1566227123998; 
 Mon, 19 Aug 2019 08:05:23 -0700 (PDT)
Received: from localhost ([61.68.68.69])
 by smtp.gmail.com with ESMTPSA id m20sm17596953pff.79.2019.08.19.08.05.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 19 Aug 2019 08:05:23 -0700 (PDT)
Date: Tue, 20 Aug 2019 01:05:16 +1000
From: Nicholas Piggin <npiggin@gmail.com>
Subject: Re: [PATCH v3 3/3] powerpc/64: optimise LOAD_REG_IMMEDIATE_SYM()
To: Christophe Leroy <christophe.leroy@c-s.fr>, Segher Boessenkool
 <segher@kernel.crashing.org>
References: <be2b971c89b1af30d680cedd14e99a83138ef40a.1566223054.git.christophe.leroy@c-s.fr>
 <92bf50b31f5f78cc76ed055b11a492e8e9e2c731.1566223054.git.christophe.leroy@c-s.fr>
 <20190819142459.GJ31406@gate.crashing.org>
In-Reply-To: <20190819142459.GJ31406@gate.crashing.org>
MIME-Version: 1.0
User-Agent: astroid/0.15.0 (https://github.com/astroidmail/astroid)
Message-Id: <1566226318.3km27rs0o4.astroid@bobo.none>
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
Cc: Paul Mackerras <paulus@samba.org>, linuxppc-dev@lists.ozlabs.org,
 linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Segher Boessenkool's on August 20, 2019 12:24 am:
> On Mon, Aug 19, 2019 at 01:58:12PM +0000, Christophe Leroy wrote:
>> -#define LOAD_REG_IMMEDIATE_SYM(reg,expr)	\
>> -	lis     reg,(expr)@highest;		\
>> -	ori     reg,reg,(expr)@higher;	\
>> -	rldicr  reg,reg,32,31;		\
>> -	oris    reg,reg,(expr)@__AS_ATHIGH;	\
>> -	ori     reg,reg,(expr)@l;
>> +#define LOAD_REG_IMMEDIATE_SYM(reg, tmp, expr)	\
>> +	lis	reg, (expr)@highest;		\
>> +	lis	tmp, (expr)@__AS_ATHIGH;	\
>> +	ori	reg, reg, (expr)@higher;	\
>> +	ori	tmp, reg, (expr)@l;		\
>> +	rldimi	reg, tmp, 32, 0
>=20
> That should be
>=20
> #define LOAD_REG_IMMEDIATE_SYM(reg, tmp, expr)	\
> 	lis	tmp, (expr)@highest;		\
> 	ori	tmp, tmp, (expr)@higher;	\
> 	lis	reg, (expr)@__AS_ATHIGH;	\
> 	ori	reg, reg, (expr)@l;		\
> 	rldimi	reg, tmp, 32, 0
>=20
> (tmp is the high half, reg is the low half, as inputs to that rldimi).

I guess the intention was also to try to fit the independent ops into
the earliest fetch/issue cycle possible.

#define LOAD_REG_IMMEDIATE_SYM(reg, tmp, expr)	\
	lis	tmp, (expr)@highest;		\
	lis	reg, (expr)@__AS_ATHIGH;	\
	ori	tmp, tmp, (expr)@higher;	\
	ori	reg, reg, (expr)@l;		\
	rldimi	reg, tmp, 32, 0

Very cool series though.

Thanks,
Nick
=
