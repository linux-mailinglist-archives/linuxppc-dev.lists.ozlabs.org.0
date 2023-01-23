Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 11F0A6779B2
	for <lists+linuxppc-dev@lfdr.de>; Mon, 23 Jan 2023 11:59:02 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4P0nCl73qDz3c9y
	for <lists+linuxppc-dev@lfdr.de>; Mon, 23 Jan 2023 21:58:59 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=isovalent-com.20210112.gappssmtp.com header.i=@isovalent-com.20210112.gappssmtp.com header.a=rsa-sha256 header.s=20210112 header.b=g4dvnAt/;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=isovalent.com (client-ip=2a00:1450:4864:20::32c; helo=mail-wm1-x32c.google.com; envelope-from=quentin@isovalent.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=isovalent-com.20210112.gappssmtp.com header.i=@isovalent-com.20210112.gappssmtp.com header.a=rsa-sha256 header.s=20210112 header.b=g4dvnAt/;
	dkim-atps=neutral
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com [IPv6:2a00:1450:4864:20::32c])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4P0nBn6WdZz3bNs
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 23 Jan 2023 21:58:07 +1100 (AEDT)
Received: by mail-wm1-x32c.google.com with SMTP id j17so8689889wms.0
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 23 Jan 2023 02:58:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=isovalent-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=GurJgwjoFQNdZqxTjXXtdzYvuIXsPElEsE5t8iRI348=;
        b=g4dvnAt/e720eUN0Hw3mkuPvGH+bA9swS9a77z573C2TdQWW6YccWP0BkoVi78A7fD
         9k0EDsHOFkjnhw2wOEifD+LuTl/asks5WHcBsVRuAWdUJEmWeCb5sfiPEmcBupKXco7L
         GbvFD/7MEwApELk4GAbMkvKPw8jqR4On0BEH3X+b1r7t6TVjEb9KegIn8YBGFz3Vv8fw
         Jh0FiWJzDYchnJxivLRKF4Wflf4aRgMtJaDCLIK/Po9RydhxUm8dX6Qe93tyzuQYH5D1
         Lg/g6wjAGZI6WGgQ22tQbhjn6II6Mckqt+Hjv3IKqVUmi0cBYkGR5LBWB5l5q+psIVBr
         2gFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=GurJgwjoFQNdZqxTjXXtdzYvuIXsPElEsE5t8iRI348=;
        b=tSCFO7HJcORlePMJsI2Xu7Bq89pK0TsErVVpce6uAPH4IHp0adiw0O0GzWISncLrho
         OQfL2cJp2gk+JwqZdd8tAgUqaNQ+xotItPhXTdH/XFYOmF5/G5izLc5XaD+FGN9EsQ1A
         xOOzr0WPxT+ELJec2tP56P5NJfwkhiszsE7NnVSRefhAYNU8LWNvAastUpe4o/F3oZZt
         +6BqXM8AyNGrbho83xzE4n9GTFjgmsLUCQb+tyRapUPj8SEnEeNiGvOf5oNgbWs5AClQ
         NsRMAxK3wv7ZX1SGxan7ghwW22n7NyyUGH5GLueMu+o2+ro84wMrcXlef0Bn0yab3HJS
         ItwA==
X-Gm-Message-State: AFqh2komAl9j2nG2bsrwC1qJ2CM0+CEvmI6/uiZS07ZHtYrlxnydrorA
	65n/kQ01Zvo+UGFmGAmEvrNd5w==
X-Google-Smtp-Source: AMrXdXsPRwYrnaXw9xX4B1eeQb0D5xrFH9eOI3n097aQpLYDHeyfCXKP4eQdFGO4lnW4dO+O4hOv4w==
X-Received: by 2002:a05:600c:3545:b0:3c6:e60f:3f4a with SMTP id i5-20020a05600c354500b003c6e60f3f4amr23649013wmq.1.1674471479963;
        Mon, 23 Jan 2023 02:57:59 -0800 (PST)
Received: from ?IPV6:2a02:8011:e80c:0:c17d:2d7f:4a94:488b? ([2a02:8011:e80c:0:c17d:2d7f:4a94:488b])
        by smtp.gmail.com with ESMTPSA id s5-20020a1cf205000000b003b47b80cec3sm10322397wmc.42.2023.01.23.02.57.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 23 Jan 2023 02:57:59 -0800 (PST)
Message-ID: <20dbac19-d510-c8f5-fd3d-588cb08a3afa@isovalent.com>
Date: Mon, 23 Jan 2023 10:57:58 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [bpf-next v2] bpf: drop deprecated bpf_jit_enable == 2
Content-Language: en-GB
To: Christophe Leroy <christophe.leroy@csgroup.eu>,
 Tonghao Zhang <tong@infragraf.org>, Andrii Nakryiko <andrii@kernel.org>
References: <20230105030614.26842-1-tong@infragraf.org>
 <ea7673e1-40ec-18be-af89-5f4fd0f71742@csgroup.eu>
 <71c83f39-f85f-d990-95b7-ab6068839e6c@iogearbox.net>
 <5836b464-290e-203f-00f2-fc6632c9f570@csgroup.eu>
 <147A796D-12C0-482F-B48A-16E67120622B@infragraf.org>
 <0b46b813-05f2-5083-9f2e-82d72970dae2@csgroup.eu>
 <0792068b-9aff-d658-5c7d-086e6d394c6c@csgroup.eu>
 <C811FC00-CE38-4227-B2E8-4CD8989D8B94@infragraf.org>
 <4ab9aafe-6436-b90d-5448-f74da22ddddb@csgroup.eu>
 <376f9737-f9a4-da68-8b7f-26020021613c@isovalent.com>
 <21b09e52-142d-92f5-4f8b-e4190f89383b@csgroup.eu>
 <43e6cd9f-ac54-46da-dba9-d535a2a77207@isovalent.com>
 <26e09ae3-dc7a-858d-c15c-7c2ff080d36d@csgroup.eu>
From: Quentin Monnet <quentin@isovalent.com>
In-Reply-To: <26e09ae3-dc7a-858d-c15c-7c2ff080d36d@csgroup.eu>
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
Cc: "linux-s390@vger.kernel.org" <linux-s390@vger.kernel.org>, Jiri Olsa <jolsa@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>, Hao Luo <haoluo@google.com>, "netdev@vger.kernel.org" <netdev@vger.kernel.org>, John Fastabend <john.fastabend@gmail.com>, "linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>, Alexei Starovoitov <ast@kernel.org>, Martin KaFai Lau <martin.lau@linux.dev>, Song Liu <song@kernel.org>, Stanislav Fomichev <sdf@google.com>, "loongarch@lists.linux.dev" <loongarch@lists.linux.dev>, Hou Tao <houtao1@huawei.com>, "sparclinux@vger.kernel.org" <sparclinux@vger.kernel.org>, Yonghong Song <yhs@fb.com>, "bpf@vger.kernel.org" <bpf@vger.kernel.org>, KP Singh <kpsingh@kernel.org>, "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>, "linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>, "naveen.n.rao@linux.ibm.com" <naveen.n.rao@linux.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

2023-01-23 07:57 UTC+0000 ~ Christophe Leroy <christophe.leroy@csgroup.eu>
> 
> 
> Le 17/01/2023 à 16:42, Quentin Monnet a écrit :
>>
>> In the meantime, you could disable the use of skeletons in bpftool, by
>> removing "clang-bpf-co-re" from FEATURE_TESTS from the Makefile. You
>> should get a functional binary, which would only miss a few features
>> (namely, printing the pids of programs holding references to BPF
>> programs, and the "bpftool prog profile" command).
> 
> Ok, with "clang-bpf-co-re" removed, bpftool doesn't complain.
> 
> However, does it work at all ?

Yes it does.

> 
> I started a 'tcpdump', I confirmed with ' bpf_jit_enable == 2' that a 
> BPF jitted program is created by tcpdump.
> 
> 'bptool prog show' and 'bpftool prog list' returns no result.

Bpftool works with eBPF, not with the older "classic" BPF (cBPF) used by
tcpdump. You should see programs listed if you load anything eBPF, for
example by using BCC tools, bpftrace, or load an eBPF program any other
way from user space:

	$ echo "int main(void) {return 0;}" | \
		clang -O2 -target bpf -c -o foo.o -x c -
	# bpftool prog load foo.o /sys/fs/bpf/foo type xdp
	# bpftool prog list
	# bpftool prog dump jited name main
	# rm /sys/fs/bpf/foo

I know tcpdump itself can show the cBPF bytecode for its programs, but I
don't know of another way to dump the JIT-ed image for cBPF programs.
Drgn could probably do it, with kernel debug symbols.

Quentin
