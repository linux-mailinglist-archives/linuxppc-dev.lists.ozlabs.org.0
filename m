Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8353E4AE333
	for <lists+linuxppc-dev@lfdr.de>; Tue,  8 Feb 2022 23:15:28 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JtclL1MGPz3cNK
	for <lists+linuxppc-dev@lfdr.de>; Wed,  9 Feb 2022 09:15:26 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=youngman.org.uk (client-ip=85.233.160.19; helo=smtp.hosts.co.uk;
 envelope-from=antlists@youngman.org.uk; receiver=<UNKNOWN>)
Received: from smtp.hosts.co.uk (smtp.hosts.co.uk [85.233.160.19])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Jtckt3VG5z2yHL
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  9 Feb 2022 09:15:00 +1100 (AEDT)
Received: from host81-132-12-162.range81-132.btcentralplus.com
 ([81.132.12.162] helo=[192.168.1.218])
 by smtp.hosts.co.uk with esmtpa (Exim)
 (envelope-from <antlists@youngman.org.uk>)
 id 1nHYjC-0006Ve-Bl; Tue, 08 Feb 2022 22:12:50 +0000
Message-ID: <d07a9d41-5a8f-a1f3-59f7-d2a75d6df2e5@youngman.org.uk>
Date: Tue, 8 Feb 2022 22:12:47 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v2 1/2] lib/raid6/test/Makefile: Use `$(pound)` instead of
 `\#` for Make 4.3
Content-Language: en-GB
To: Paul Menzel <pmenzel@molgen.mpg.de>, Alexei Starovoitov <ast@kernel.org>, 
 Daniel Borkmann <daniel@iogearbox.net>, Andrii Nakryiko <andrii@kernel.org>,
 Martin KaFai Lau <kafai@fb.com>, Song Liu <songliubraving@fb.com>,
 Yonghong Song <yhs@fb.com>, John Fastabend <john.fastabend@gmail.com>,
 KP Singh <kpsingh@kernel.org>
References: <20220208152148.48534-1-pmenzel@molgen.mpg.de>
From: Wols Lists <antlists@youngman.org.uk>
In-Reply-To: <20220208152148.48534-1-pmenzel@molgen.mpg.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
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
Cc: linux-kernel@vger.kernel.org, Matt Brown <matthew.brown.dev@gmail.com>,
 linux-raid@vger.kernel.org, Song Liu <song@kernel.org>, netdev@vger.kernel.org,
 bpf@vger.kernel.org, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 08/02/2022 15:21, Paul Menzel wrote:
> So, do the same as commit 9564a8cf422d ("Kbuild: fix # escaping in .cmd
> files for future Make") and commit 929bef467771 ("bpf: Use $(pound) instead
> of \# in Makefiles") and define and use a `$(pound)` variable.

As commented elsewhere, for the sake of us ENGLISH speakers, *PLEASE* 
make that $(hash). A pound sign is £.

Cheers,
Wol
