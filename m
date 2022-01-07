Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id D709C487561
	for <lists+linuxppc-dev@lfdr.de>; Fri,  7 Jan 2022 11:22:36 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JVfRZ5gdBz3cSH
	for <lists+linuxppc-dev@lfdr.de>; Fri,  7 Jan 2022 21:22:34 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=iogearbox.net (client-ip=213.133.104.62;
 helo=www62.your-server.de; envelope-from=daniel@iogearbox.net;
 receiver=<UNKNOWN>)
Received: from www62.your-server.de (www62.your-server.de [213.133.104.62])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JVfR33PyJz3bY6
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  7 Jan 2022 21:22:07 +1100 (AEDT)
Received: from sslproxy02.your-server.de ([78.47.166.47])
 by www62.your-server.de with esmtpsa (TLSv1.3:TLS_AES_256_GCM_SHA384:256)
 (Exim 4.92.3) (envelope-from <daniel@iogearbox.net>)
 id 1n5mNj-000D7w-Ok; Fri, 07 Jan 2022 11:21:59 +0100
Received: from [85.1.206.226] (helo=linux.home)
 by sslproxy02.your-server.de with esmtpsa (TLSv1.3:TLS_AES_256_GCM_SHA384:256)
 (Exim 4.92) (envelope-from <daniel@iogearbox.net>)
 id 1n5mNj-000VjQ-EM; Fri, 07 Jan 2022 11:21:59 +0100
Subject: Re: [PATCH 01/13] bpf: Guard against accessing NULL pt_regs in
 bpf_get_task_stack()
To: "Naveen N. Rao" <naveen.n.rao@linux.vnet.ibm.com>,
 Michael Ellerman <mpe@ellerman.id.au>,
 Alexei Starovoitov <alexei.starovoitov@gmail.com>
References: <cover.1641468127.git.naveen.n.rao@linux.vnet.ibm.com>
 <d5ef83c361cc255494afd15ff1b4fb02a36e1dcf.1641468127.git.naveen.n.rao@linux.vnet.ibm.com>
From: Daniel Borkmann <daniel@iogearbox.net>
Message-ID: <b15d77fb-4730-60ba-babe-b1c007be998b@iogearbox.net>
Date: Fri, 7 Jan 2022 11:21:59 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.2
MIME-Version: 1.0
In-Reply-To: <d5ef83c361cc255494afd15ff1b4fb02a36e1dcf.1641468127.git.naveen.n.rao@linux.vnet.ibm.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Authenticated-Sender: daniel@iogearbox.net
X-Virus-Scanned: Clear (ClamAV 0.103.3/26415/Fri Jan  7 10:26:59 2022)
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
Cc: ykaliuta@redhat.com, johan.almbladh@anyfinetworks.com,
 linuxppc-dev@lists.ozlabs.org, song@kernel.org, bpf@vger.kernel.org,
 Jiri Olsa <jolsa@redhat.com>, Hari Bathini <hbathini@linux.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 1/6/22 12:45 PM, Naveen N. Rao wrote:
> task_pt_regs() can return NULL on powerpc for kernel threads. This is
> then used in __bpf_get_stack() to check for user mode, resulting in a
> kernel oops. Guard against this by checking return value of
> task_pt_regs() before trying to obtain the call chain.
> 
> Fixes: fa28dcb82a38f8 ("bpf: Introduce helper bpf_get_task_stack()")
> Cc: stable@vger.kernel.org # v5.9+
> Signed-off-by: Naveen N. Rao <naveen.n.rao@linux.vnet.ibm.com>

Acked-by: Daniel Borkmann <daniel@iogearbox.net>
