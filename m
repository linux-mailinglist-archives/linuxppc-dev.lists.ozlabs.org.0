Return-Path: <linuxppc-dev+bounces-4729-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id BE234A031E7
	for <lists+linuxppc-dev@lfdr.de>; Mon,  6 Jan 2025 22:15:31 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YRn5X6X2lz2yDH;
	Tue,  7 Jan 2025 08:15:28 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2604:1380:45d1:ec00::3"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1736198128;
	cv=none; b=B0PnmpcBQG6ZAsRmiA2l0gVhYNzxpOze27vDv3ALRxLE0t7XiMssBAmlepk73rlWdDX5PYlM3W2h9TbiXgL/FCizpYuDjVgYYevSEl2+lvdPWvFmJm7GgxKq2roWa4myemS/f8TTyFLAQUcqy9qkS8adwKfhEi13t+H64Vn5pIcieKriMdZN0xO+DcqFTJ9XAJHFjB8oEGkvHfYReQ7TCRwvwZgOy305twRWl2zAC0jvEc3ksFkx3rdZUt7eC5gz985dyqdwiFbcEMsNuMD14E+6PmUmmgNkJJUyG4s/l1JdP+HgBr71Nc7RVu9gzYL4EgmNgRwjjZwrCnE+kIID5g==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1736198128; c=relaxed/relaxed;
	bh=DDcR8Y2nQap6isM4yzcBhuLulxQn4fp7frqrTfpm25Q=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XFjKZbpv0hxJqardQ1Z6MaXrRHFHzXTyOtwFR/TFNZqpFgc59zHI02+f+j/oQqmfnLsW85QT+NkHUmw63l/bothyjI+MsfoNmt9Fo9FE7Dvl/E73RFRnM3lDQBjiu/qG9b67j6x3RD9YOGenoBHCZZUmOqSMKvhknABuu59v5g0ZdMWwTTg2Tlcclz3JyDlD3bp0exiAQ6GUMOH20cijiHCtIwbH1PFthz2Sfc4KgHS9NdjGkhqIRHAmXcbTyxUkpLL5uouHVYv6Lpbw0zmaw7wGnN59bOlpiswLPpPTjG9OkAfl3s2spphoVLVHYySPdpXb6z/5xtGHTcQsM8uumA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=dwGagPV4; dkim-atps=neutral; spf=pass (client-ip=2604:1380:45d1:ec00::3; helo=nyc.source.kernel.org; envelope-from=namhyung@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=dwGagPV4;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:45d1:ec00::3; helo=nyc.source.kernel.org; envelope-from=namhyung@kernel.org; receiver=lists.ozlabs.org)
Received: from nyc.source.kernel.org (nyc.source.kernel.org [IPv6:2604:1380:45d1:ec00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4YRn5W5mNMz2y8k
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  7 Jan 2025 08:15:27 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 11A14A41E96;
	Mon,  6 Jan 2025 21:13:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2D953C4CED2;
	Mon,  6 Jan 2025 21:15:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1736198124;
	bh=IlUoArd3cgICxTGfsWTXC+9GlSm6A1FG5iyMIObahC0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=dwGagPV4zLkJa5iQxsPetExJbd2Anx2BZkFgd93Zg9A4i6J9V03AAp8GtT14zgXy2
	 fBqK0+rm6zyUhARLe6/oaTN6y6IG2Tx4SnBSir04ItlTfdwGBC4CDH+SdWQ4gJes3G
	 RWpAEPrAHGH2dn6sFTadTjz2L05Reo9/6n9tF4MiWFiPE2E1o4EqHKfXIKLh/+LwEH
	 DDIPupJY7U0qRZ8It5lESknB8k/g0b9GSyCEldvE9FFg5Iuu5Wsd2z7SYmDsT4PZGy
	 QxwjJcWjzNkX1ypXCbxL8VnuyLlPPSBt1i0f+CE9zrJ4wR8Gftrz0Q0U1T9DiRmVe5
	 ZJMUtFO1VYqIQ==
Date: Mon, 6 Jan 2025 13:15:22 -0800
From: Namhyung Kim <namhyung@kernel.org>
To: Athira Rajeev <atrajeev@linux.vnet.ibm.com>
Cc: acme@kernel.org, jolsa@kernel.org, adrian.hunter@intel.com,
	irogers@google.com, linux-kernel@vger.kernel.org,
	linux-perf-users@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
	maddy@linux.ibm.com, kjain@linux.ibm.com,
	disgoel@linux.vnet.ibm.com
Subject: Re: [PATCH] tools/perf: Fix return code for lock_contention_prepare
Message-ID: <Z3xH6kCK9zj5ttZM@google.com>
References: <20241223135655.8042-1-atrajeev@linux.vnet.ibm.com>
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Owner: <mailto:linuxppc-dev+owner@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Archive: <https://lore.kernel.org/linuxppc-dev/>,
  <https://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20241223135655.8042-1-atrajeev@linux.vnet.ibm.com>
X-Spam-Status: No, score=-2.8 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

Hello,

On Mon, Dec 23, 2024 at 07:26:55PM +0530, Athira Rajeev wrote:
> perf lock contention returns zero exit value even if the lock contention
> BPF setup failed.
> 
>    # ./perf lock con -b true
>    libbpf: kernel BTF is missing at '/sys/kernel/btf/vmlinux', was CONFIG_DEBUG_INFO_BTF enabled?
>    libbpf: failed to find '.BTF' ELF section in /lib/modules/6.13.0-rc3+/build/vmlinux
>    libbpf: failed to find valid kernel BTF
>    libbpf: kernel BTF is missing at '/sys/kernel/btf/vmlinux', was CONFIG_DEBUG_INFO_BTF enabled?
>    libbpf: failed to find '.BTF' ELF section in /lib/modules/6.13.0-rc3+/build/vmlinux
>    libbpf: failed to find valid kernel BTF
>    libbpf: Error loading vmlinux BTF: -ESRCH
>    libbpf: failed to load object 'lock_contention_bpf'
>    libbpf: failed to load BPF skeleton 'lock_contention_bpf': -ESRCH
>    Failed to load lock-contention BPF skeleton
>    lock contention BPF setup failed
>    # echo $?
>     0
> 
> Fix this by saving the return code for lock_contention_prepare
> so that command exits with proper return code
> 
> Signed-off-by: Athira Rajeev <atrajeev@linux.vnet.ibm.com>

Thanks for the fix, the change itself looks good but I think we need the
same for setup_output_field() and select_key() as well.

Thanks,
Namhyung


> ---
>  tools/perf/builtin-lock.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/tools/perf/builtin-lock.c b/tools/perf/builtin-lock.c
> index 208c482daa56..2226c7dd4ae6 100644
> --- a/tools/perf/builtin-lock.c
> +++ b/tools/perf/builtin-lock.c
> @@ -2049,7 +2049,8 @@ static int __cmd_contention(int argc, const char **argv)
>  				goto out_delete;
>  		}
>  
> -		if (lock_contention_prepare(&con) < 0) {
> +		err = lock_contention_prepare(&con);
> +		if (err < 0) {
>  			pr_err("lock contention BPF setup failed\n");
>  			goto out_delete;
>  		}
> -- 
> 2.43.5
> 

