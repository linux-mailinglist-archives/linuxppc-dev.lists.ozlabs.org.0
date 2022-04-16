Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id E0D5650380E
	for <lists+linuxppc-dev@lfdr.de>; Sat, 16 Apr 2022 21:41:02 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Kgk8D5mzHz3bl9
	for <lists+linuxppc-dev@lfdr.de>; Sun, 17 Apr 2022 05:41:00 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=TvlBjYUb;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::52f;
 helo=mail-pg1-x52f.google.com; envelope-from=f.fainelli@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=TvlBjYUb; dkim-atps=neutral
Received: from mail-pg1-x52f.google.com (mail-pg1-x52f.google.com
 [IPv6:2607:f8b0:4864:20::52f])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Kgk6J1xyHz3c8B
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 17 Apr 2022 05:39:20 +1000 (AEST)
Received: by mail-pg1-x52f.google.com with SMTP id 32so12019158pgl.4
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 16 Apr 2022 12:39:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=voxZ31qFlafqYv1KtZJxqTUhs3UryZT4D28XGScW+a0=;
 b=TvlBjYUb6jvPOj6IsHs0M9D5K2wvs0b2TjFENcykUyDcKNPhtWD7iiraagCgqnJXfu
 X+jWY3fdoRuNHTcyuhmbSM4+oTmU5ijesNoWgO69Hbbtr7J7eWUHkK0UDPlx1PL0WIQ7
 ctE0EbnqX3CCOG03pvoofNEdEaIrccBASxSjLWufJk1+DLF69pfywyReEZfxiL11dMra
 Ps8v6vgJ15q9TfbBLnIDgOoZ8gkJMqSOOG18LFapmNk8lSO6ei6E8GlHG+yaa1dFz/Pd
 UIr07HeEO/b981RrT/3upCExQJ5heif2jOckyrNIwVRqXEc4tNrKiEzZmnXwq18NRSK+
 hKug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=voxZ31qFlafqYv1KtZJxqTUhs3UryZT4D28XGScW+a0=;
 b=zPfM/lmegIahZKg8u4QIB7e9qcYmhE1D9pQvFzEBI17EJD+Bg77xEDg8XklBlvfmWi
 NJCbV6HVrqQP8Iu27umwnBWLe9MNvsFoFrCxCMZG68SMMphgFKVVrMQuB4FX2pte923H
 atgbPpgsShdza6n8qM39tzhPNz+0yT7/6cq3N/ik84Mdvxw/CcT2AFp7KA/1ZjYERiB3
 QMqAhGeMbSLxzXyP2M8WafHof91SKQ0dkEhTYj/h65TrqM6s7QGaVm6P571cCITsUiot
 2JpjSqv0e5lbaseOpoR8rFsEkRunbglPa18EZVpq6Bys8hr8GcLC7VpFU7FNWijirsEy
 jQ+A==
X-Gm-Message-State: AOAM533JK664EuaHRBp96nt92YRNKjS6l7kRhlq0zo1IOR2+aSfNipBp
 VsAImTLaP4GZvi2pYrUlpNA=
X-Google-Smtp-Source: ABdhPJwpJnw7UFOao4GWq7HDPD7r7/mQ3y+uk5lJFjJ5tekzMlbaH4EjnEsFU6hBsHkI+VxR4u/mGQ==
X-Received: by 2002:a63:d13:0:b0:381:f043:c627 with SMTP id
 c19-20020a630d13000000b00381f043c627mr4027727pgl.168.1650137956942; 
 Sat, 16 Apr 2022 12:39:16 -0700 (PDT)
Received: from [192.168.1.3] (ip72-194-116-95.oc.oc.cox.net. [72.194.116.95])
 by smtp.gmail.com with ESMTPSA id
 g200-20020a6252d1000000b0050833d7602csm6839324pfb.103.2022.04.16.12.39.13
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 16 Apr 2022 12:39:16 -0700 (PDT)
Message-ID: <8f140d64-e486-f02c-c9c5-09e6c740220c@gmail.com>
Date: Sat, 16 Apr 2022 12:39:13 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PATCH net-next v4 03/18] net: dsa: sja1105: reorder
 sja1105_first_entry_longer_than with memory allocation
Content-Language: en-US
To: Jakob Koschel <jakobkoschel@gmail.com>,
 "David S. Miller" <davem@davemloft.net>
References: <20220415122947.2754662-1-jakobkoschel@gmail.com>
 <20220415122947.2754662-4-jakobkoschel@gmail.com>
From: Florian Fainelli <f.fainelli@gmail.com>
In-Reply-To: <20220415122947.2754662-4-jakobkoschel@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
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
Cc: Andrew Lunn <andrew@lunn.ch>, Song Liu <songliubraving@fb.com>,
 Alexei Starovoitov <ast@kernel.org>, Eric Dumazet <edumazet@google.com>,
 Paul Mackerras <paulus@samba.org>, Ariel Elior <aelior@marvell.com>,
 Daniel Borkmann <daniel@iogearbox.net>,
 Steen Hegelund <Steen.Hegelund@microchip.com>,
 John Fastabend <john.fastabend@gmail.com>, Andrii Nakryiko <andrii@kernel.org>,
 "Bos, H.J." <h.j.bos@vu.nl>, linux-arm-kernel@lists.infradead.org,
 Vladimir Oltean <vladimir.oltean@nxp.com>, Yonghong Song <yhs@fb.com>,
 Paolo Abeni <pabeni@redhat.com>, Vivien Didelot <vivien.didelot@gmail.com>,
 Bjarni Jonasson <bjarni.jonasson@microchip.com>, Jiri Pirko <jiri@resnulli.us>,
 Arnd Bergmann <arnd@arndb.de>, KP Singh <kpsingh@kernel.org>,
 Jakub Kicinski <kuba@kernel.org>,
 Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
 Martin Habets <habetsm.xilinx@gmail.com>,
 Brian Johannesmeyer <bjohannesmeyer@gmail.com>,
 Lars Povlsen <lars.povlsen@microchip.com>,
 Colin Ian King <colin.king@intel.com>, Manish Chopra <manishc@marvell.com>,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 UNGLinuxDriver@microchip.com, Edward Cree <ecree.xilinx@gmail.com>,
 Casper Andersson <casper.casan@gmail.com>, Xu Wang <vulab@iscas.ac.cn>,
 Cristiano Giuffrida <c.giuffrida@vu.nl>, bpf@vger.kernel.org,
 Vladimir Oltean <olteanv@gmail.com>, linuxppc-dev@lists.ozlabs.org,
 Martin KaFai Lau <kafai@fb.com>, Mike Rapoport <rppt@kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



On 4/15/2022 5:29 AM, Jakob Koschel wrote:
> From: Vladimir Oltean <vladimir.oltean@nxp.com>
> 
> sja1105_first_entry_longer_than() does not make use of the full struct
> sja1105_gate_entry *e, just of e->interval which is set from the passed
> entry_time.
> 
> This means that if there is a gate conflict, we have allocated e for
> nothing, just to free it later. Reorder the memory allocation and the
> function call, to avoid that and simplify the error unwind path.
> 
> Signed-off-by: Vladimir Oltean <vladimir.oltean@nxp.com>
> Signed-off-by: Jakob Koschel <jakobkoschel@gmail.com>

Reviewed-by: Florian Fainelli <f.fainelli@gmail.com>
-- 
Florian
