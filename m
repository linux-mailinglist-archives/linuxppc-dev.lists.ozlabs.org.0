Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 832749D8BF
	for <lists+linuxppc-dev@lfdr.de>; Mon, 26 Aug 2019 23:56:33 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46HQnV5YqrzDqll
	for <lists+linuxppc-dev@lfdr.de>; Tue, 27 Aug 2019 07:56:30 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=iogearbox.net
 (client-ip=213.133.104.62; helo=www62.your-server.de;
 envelope-from=daniel@iogearbox.net; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=iogearbox.net
X-Greylist: delayed 1226 seconds by postgrey-1.36 at bilbo;
 Tue, 27 Aug 2019 07:54:51 AEST
Received: from www62.your-server.de (www62.your-server.de [213.133.104.62])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46HQlb1qWxzDqht
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 27 Aug 2019 07:54:51 +1000 (AEST)
Received: from sslproxy05.your-server.de ([78.46.172.2])
 by www62.your-server.de with esmtpsa (TLSv1.2:DHE-RSA-AES256-GCM-SHA384:256)
 (Exim 4.89_1) (envelope-from <daniel@iogearbox.net>)
 id 1i2Mcw-0003JB-Am; Mon, 26 Aug 2019 23:34:14 +0200
Received: from [178.197.249.36] (helo=pc-63.home)
 by sslproxy05.your-server.de with esmtpsa
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.89)
 (envelope-from <daniel@iogearbox.net>)
 id 1i2Mcw-000BMQ-3A; Mon, 26 Aug 2019 23:34:14 +0200
Subject: Re: [PATCH] bpf: handle 32-bit zext during constant blinding
To: "Naveen N. Rao" <naveen.n.rao@linux.vnet.ibm.com>,
 Alexei Starovoitov <alexei.starovoitov@gmail.com>,
 Jiong Wang <jiong.wang@netronome.com>
References: <20190821192358.31922-1-naveen.n.rao@linux.vnet.ibm.com>
From: Daniel Borkmann <daniel@iogearbox.net>
Message-ID: <776c3058-ebd4-f30d-7392-03a4a94c2483@iogearbox.net>
Date: Mon, 26 Aug 2019 23:34:13 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.2
MIME-Version: 1.0
In-Reply-To: <20190821192358.31922-1-naveen.n.rao@linux.vnet.ibm.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Authenticated-Sender: daniel@iogearbox.net
X-Virus-Scanned: Clear (ClamAV 0.100.3/25553/Mon Aug 26 10:32:22 2019)
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
Cc: bpf@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 linux-kernel@vger.kernel.org, netdev@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 8/21/19 9:23 PM, Naveen N. Rao wrote:
> Since BPF constant blinding is performed after the verifier pass, the
> ALU32 instructions inserted for doubleword immediate loads don't have a
> corresponding zext instruction. This is causing a kernel oops on powerpc
> and can be reproduced by running 'test_cgroup_storage' with
> bpf_jit_harden=2.
> 
> Fix this by emitting BPF_ZEXT during constant blinding if
> prog->aux->verifier_zext is set.
> 
> Fixes: a4b1d3c1ddf6cb ("bpf: verifier: insert zero extension according to analysis result")
> Reported-by: Michael Ellerman <mpe@ellerman.id.au>
> Signed-off-by: Naveen N. Rao <naveen.n.rao@linux.vnet.ibm.com>

LGTM, applied to bpf, thanks!
