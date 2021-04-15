Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id CA0F236146A
	for <lists+linuxppc-dev@lfdr.de>; Thu, 15 Apr 2021 23:59:36 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FLtY25w9Jz3c46
	for <lists+linuxppc-dev@lfdr.de>; Fri, 16 Apr 2021 07:59:34 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=isovalent-com.20150623.gappssmtp.com header.i=@isovalent-com.20150623.gappssmtp.com header.a=rsa-sha256 header.s=20150623 header.b=BEj/1/8X;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=isovalent.com (client-ip=2a00:1450:4864:20::42a;
 helo=mail-wr1-x42a.google.com; envelope-from=quentin@isovalent.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=isovalent-com.20150623.gappssmtp.com
 header.i=@isovalent-com.20150623.gappssmtp.com header.a=rsa-sha256
 header.s=20150623 header.b=BEj/1/8X; dkim-atps=neutral
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com
 [IPv6:2a00:1450:4864:20::42a])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FLk8x2Pnyz2yZR
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 16 Apr 2021 01:41:35 +1000 (AEST)
Received: by mail-wr1-x42a.google.com with SMTP id a4so23782583wrr.2
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 15 Apr 2021 08:41:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=isovalent-com.20150623.gappssmtp.com; s=20150623;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=qzCmIc5xh7d+ubWNy7gZo3UPfbkyUvg8kMmWmppBNes=;
 b=BEj/1/8XPncnjRfRK8mLiZ1SoZ2+BwrE+a39LxPwB/MsIFJnzBAICQLZ2jiwGGbQov
 4zqh7un0jhEP1iNaKM1PurWOo4uOYi/n2gtxwCVm76y8egSWq0m6KnadRWC5DH8hi34C
 K41+UsN0jCiClEebcR9kPZsL0Lx6/VJV5Li9dNkP8mG/+bW6Uxqyyarpphfbe13+sVlb
 FizX/3RV1YXqCKanusixVoY8OxsNOXFXCWpfkOB2NeLmRvAHXodqwMYxxCYasGQZQftV
 OsBicx1g9iYrnNMRoDBiJ4p9GtlEji++P0zPJAhhkeDvxObWb1E6q5IO+XBq+ah9VkM2
 b8CQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=qzCmIc5xh7d+ubWNy7gZo3UPfbkyUvg8kMmWmppBNes=;
 b=LqvYh5xyUJQMaiqo751ujE3UviMh++OhlQUE5rJNAeb+nmqA0fyl84ACSWcY0TdwEe
 1YSSsttwOXvtC9gn2zXXO/PGAj83bNwNpquwkKjwkewfT1Jl1VBq8rTX4W4pysKpkSzi
 yzGv1FTc85utbYg6+oSfhFZ/6lit/Qiavpa+L3ewUnWhvwwi4xFpyxpq5Hs94MfrxoPt
 fE2lKJUJpYOLrjg2W6N1BCFxoIlYpKd4J0mQGIt9F1q1AdXhjPJL0gbiCKQ55Pj7nVQt
 It3mumAifIic5CNHENncMq+9WJAM1lulDYnIaNGXLj6SV7C8VP4CxYr4zZ72InJXV7Wf
 OaJg==
X-Gm-Message-State: AOAM530uoYQupJGuRTK0RBu3hNnug/vD917GTsPtHILRqa2QVctba8an
 e1aVtkrWmgCs//T8oba7A2I4oA==
X-Google-Smtp-Source: ABdhPJyLNMOWPYjLpplPAmINNkz2Fou+qVJXho8kWclmtHcejA/NRHvG9yzn7ifRTNHYBMXjICP1Nw==
X-Received: by 2002:a05:6000:ca:: with SMTP id
 q10mr4272021wrx.104.1618501286182; 
 Thu, 15 Apr 2021 08:41:26 -0700 (PDT)
Received: from [192.168.1.8] ([149.86.87.196])
 by smtp.gmail.com with ESMTPSA id l14sm1920076wmq.4.2021.04.15.08.41.24
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 15 Apr 2021 08:41:25 -0700 (PDT)
Subject: Re: [PATCH bpf-next 1/2] bpf: Remove bpf_jit_enable=2 debugging mode
To: Daniel Borkmann <daniel@iogearbox.net>, Jianlin Lv <Jianlin.Lv@arm.com>,
 bpf@vger.kernel.org
References: <20210415093250.3391257-1-Jianlin.Lv@arm.com>
 <9c4a78d2-f73c-832a-e6e2-4b4daa729e07@iogearbox.net>
From: Quentin Monnet <quentin@isovalent.com>
Message-ID: <d3949501-8f7d-57c4-b3fe-bcc3b24c09d8@isovalent.com>
Date: Thu, 15 Apr 2021 16:41:23 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.9.1
MIME-Version: 1.0
In-Reply-To: <9c4a78d2-f73c-832a-e6e2-4b4daa729e07@iogearbox.net>
Content-Type: text/plain; charset=utf-8
Content-Language: en-GB
Content-Transfer-Encoding: 7bit
X-Mailman-Approved-At: Fri, 16 Apr 2021 07:58:52 +1000
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
Cc: irogers@google.com, songliubraving@fb.com, catalin.marinas@arm.com,
 linux-doc@vger.kernel.org, zlim.lnx@gmail.com, paul.walmsley@sifive.com,
 ast@kernel.org, andrii@kernel.org, paulus@samba.org, sandipan@linux.ibm.com,
 hpa@zytor.com, sparclinux@vger.kernel.org, illusionist.neo@gmail.com,
 maheshb@google.com, will@kernel.org, nicolas.dichtel@6wind.com,
 linux-s390@vger.kernel.org, iii@linux.ibm.com, paulburton@kernel.org,
 corbet@lwn.net, mchehab+huawei@kernel.org, masahiroy@kernel.org,
 x86@kernel.org, john.fastabend@gmail.com, linux@armlinux.org.uk,
 linux-riscv@lists.infradead.org, borntraeger@de.ibm.com, mingo@redhat.com,
 linux-arm-kernel@lists.infradead.org, naveen.n.rao@linux.ibm.com,
 kuba@kernel.org, tklauser@distanz.ch, linux-mips@vger.kernel.org,
 grantseltzer@gmail.com, xi.wang@gmail.com, aou@eecs.berkeley.edu,
 keescook@chromium.org, gor@linux.ibm.com, luke.r.nels@gmail.com,
 linux-kernel@vger.kernel.org, hca@linux.ibm.com, kpsingh@kernel.org,
 iecedge@gmail.com, horms@verge.net.au, bp@alien8.de, viro@zeniv.linux.org.uk,
 yhs@fb.com, tglx@linutronix.de, dvyukov@google.com, tsbogend@alpha.franken.de,
 yoshfuji@linux-ipv6.org, netdev@vger.kernel.org, dsahern@kernel.org,
 udknight@gmail.com, kafai@fb.com, bjorn@kernel.org, palmer@dabbelt.com,
 linuxppc-dev@lists.ozlabs.org, davem@davemloft.net
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

2021-04-15 16:37 UTC+0200 ~ Daniel Borkmann <daniel@iogearbox.net>
> On 4/15/21 11:32 AM, Jianlin Lv wrote:
>> For debugging JITs, dumping the JITed image to kernel log is discouraged,
>> "bpftool prog dump jited" is much better way to examine JITed dumps.
>> This patch get rid of the code related to bpf_jit_enable=2 mode and
>> update the proc handler of bpf_jit_enable, also added auxiliary
>> information to explain how to use bpf_jit_disasm tool after this change.
>>
>> Signed-off-by: Jianlin Lv <Jianlin.Lv@arm.com>

Hello,

For what it's worth, I have already seen people dump the JIT image in
kernel logs in Qemu VMs running with just a busybox, not for kernel
development, but in a context where buiding/using bpftool was not
possible. Maybe not a common case, but still, removing the debugging
mode will make that impossible. Is there a particular incentive to
remove the feature?

Best regards,
Quentin
