Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 069FC503810
	for <lists+linuxppc-dev@lfdr.de>; Sat, 16 Apr 2022 21:41:39 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Kgk8w6C0Lz3cB6
	for <lists+linuxppc-dev@lfdr.de>; Sun, 17 Apr 2022 05:41:36 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=M84mj+tp;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::1030;
 helo=mail-pj1-x1030.google.com; envelope-from=f.fainelli@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=M84mj+tp; dkim-atps=neutral
Received: from mail-pj1-x1030.google.com (mail-pj1-x1030.google.com
 [IPv6:2607:f8b0:4864:20::1030])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Kgk7B494bz3cDp
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 17 Apr 2022 05:40:06 +1000 (AEST)
Received: by mail-pj1-x1030.google.com with SMTP id bx5so10063520pjb.3
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 16 Apr 2022 12:40:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=5Xp410sF+GGnn+k64Aem0Bq20nF9FpJBZpOgxpPYfOM=;
 b=M84mj+tp2XRkS5+g1JBD/J8nfprjEP9Xx2ytgoZNWcMBTTP42X6ZRSpXcO7hFe9/Oo
 02aTUR9pmaftVGumtn+BD0zsgzRHDeeUYHwEZC46IvXiynXEGk8BVJKSu95AVDXsZt/p
 t4JHw/IOVAdlggDWBqPfnE7MIrjLrPcArBrvKK0bI1L4x2vd1vZfodtEunrv9+5jLivM
 RzhLPK+IwE7X9yHdqZHpyQL945co1l+I2H3dg4bprjOYNxzRhsDn2KREvTF9IHC/cj2R
 tr0HjN9UjNAV+ZBbsyTRaWC4SvKM2xUt/7A9G6LwnqiPikL7XXqAcKH2zVuvh1Mt9ONg
 hC9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=5Xp410sF+GGnn+k64Aem0Bq20nF9FpJBZpOgxpPYfOM=;
 b=FibqXeu5/A/SYOw4gRn98JqL+RqBiB3AiHbdzMEo0bK5/EH6CshFv4oMQR/LjKH0D3
 YOWWSbWotIDSmkXQhzMWRpwDL1ZoohVHxKXSHSa3W+astfxzCoUDg3WGXJv0lCkgX4ZM
 8tpddy/ZKEn5uinlkOD9CwZT3RPNHzVD8YySYuW0SJagwDX9nFUD+zf9cBK0DfT20Ou7
 JBcsiJJ2CNZBndxHTNT4C3lEdAqUdO2xc/+7FIRh4y45D8LvL8HWHXcEl30b6ydfJPms
 DEyQD4N+H3ASlcEtT/pj/JlPZ9u2gWoxW40vgUpaDlgdWbUV0CPq33joyJLfuGQbH2IF
 n4DA==
X-Gm-Message-State: AOAM531VBGqdIIC0/cZgNpC+9OPbBnu+29ukZtLASAiPraO+l7Rzygrc
 egCqO3NiSAuDGyg0mMVESD0=
X-Google-Smtp-Source: ABdhPJwnTW8KqhnPwjGmeCpgHceRrEhsRLl5L0AQzXm3+Da3tFcNkHwGjE0Bz7pgd1D+I0xXP4IsAg==
X-Received: by 2002:a17:902:ea0d:b0:158:5910:d683 with SMTP id
 s13-20020a170902ea0d00b001585910d683mr4720898plg.95.1650138004440; 
 Sat, 16 Apr 2022 12:40:04 -0700 (PDT)
Received: from [192.168.1.3] (ip72-194-116-95.oc.oc.cox.net. [72.194.116.95])
 by smtp.gmail.com with ESMTPSA id
 a19-20020a17090aa51300b001cde7228b61sm8322237pjq.47.2022.04.16.12.40.01
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 16 Apr 2022 12:40:03 -0700 (PDT)
Message-ID: <725e814d-da65-b77d-1a6e-a029d594944f@gmail.com>
Date: Sat, 16 Apr 2022 12:40:00 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PATCH net-next v4 02/18] net: dsa: sja1105: remove use of
 iterator after list_for_each_entry() loop
Content-Language: en-US
To: Jakob Koschel <jakobkoschel@gmail.com>,
 "David S. Miller" <davem@davemloft.net>
References: <20220415122947.2754662-1-jakobkoschel@gmail.com>
 <20220415122947.2754662-3-jakobkoschel@gmail.com>
From: Florian Fainelli <f.fainelli@gmail.com>
In-Reply-To: <20220415122947.2754662-3-jakobkoschel@gmail.com>
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
> The link below explains that there is a desire to syntactically change
> list_for_each_entry() and list_for_each() such that it becomes
> impossible to use the iterator variable outside the scope of the loop.
> 
> Although sja1105_insert_gate_entry() makes legitimate use of the
> iterator pointer when it breaks out, the pattern it uses may become
> illegal, so it needs to change.
> 
> It is deemed acceptable to use a copy of the loop iterator, and
> sja1105_insert_gate_entry() only needs to know the list_head element
> before which the list insertion should be made. So let's profit from the
> occasion and refactor the list iteration to a dedicated function.
> 
> An additional benefit is given by the fact that with the helper function
> in place, we no longer need to special-case the empty list, since it is
> equivalent to not having found any gating entry larger than the
> specified interval in the list. We just need to insert at the tail of
> that list (list_add vs list_add_tail on an empty list does the same
> thing).
> 
> Link: https://patchwork.kernel.org/project/netdevbpf/patch/20220407102900.3086255-3-jakobkoschel@gmail.com/#24810127
> Signed-off-by: Vladimir Oltean <vladimir.oltean@nxp.com>
> Signed-off-by: Jakob Koschel <jakobkoschel@gmail.com>

Reviewed-by: Florian Fainelli <f.fainelli@gmail.com>
-- 
Florian
