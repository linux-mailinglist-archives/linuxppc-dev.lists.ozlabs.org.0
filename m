Return-Path: <linuxppc-dev+bounces-6812-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E381A57025
	for <lists+linuxppc-dev@lfdr.de>; Fri,  7 Mar 2025 19:10:06 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Z8Z7v4G1cz3c8l;
	Sat,  8 Mar 2025 05:10:03 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=147.75.193.91
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1741371003;
	cv=none; b=EVlZK6TGw46CQ/uSenXnNikf6KtXw6w/0ZIW1vWThxoLnczvnBVw7rz2e00eP+UsBgsJQvrE59xXX/tjQf92rfom/IgyCnf6m5kmV6wtHg6QclpmT0bMMyHbf9aIsdN0Bxsuh3qV7XwYXOKXUWS84xjvLWgWSF0NHuxgj4rfHsTfXBqbMiYx7ZbhGBgcDcN/AwvLCM6oiaYxO6RZ2wFoOke6EVfTPTNfXVBKE/TlsZ9xxPW9lhek4kEEdOdYtQ45staHbr/vhQ78W4XvIKFhaLJziUrRLKNjRErv1SxKN3emySFNWVKmc/NnOpPYig+ksnzHCKXaI+FhYAtBOMK1lA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1741371003; c=relaxed/relaxed;
	bh=A4JOrzu/xmn6zZSfPWhCEcXHDeApKzLs5uT/zm6NZeU=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=E3MORFlaQXmTy3oQ/OIjTRlCXPkOxOpVYaIlUdkyrHsVozE2gQ6Azn8VZ+OtvPUcx1yc2nU1ns/4BAPZF8zUr8DK3xiZ/QrRPghwOBB5HsZ4UI9Zkqvy+RfnLk+6IY91dmAexSlt92fn6DCcEbyqjG+xjPVXQyNZF0CTUIXzD80Yv8xlu1t6oENcuDQW4nFdixogpnKtJtLGsTgMdUeX2IOnTxpv2CeBzv4lPIzM/JQWdRy5VQen+q03N9BbFOVjUm8t4JNCYVbL3Lymnw7ZhRpNqdu7Cf3Mt8kDXp9nWMUNIFUzJd4NZ9ygfBrNupmCRASJkyJK20yw2Z1FsbNRCQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=NV7gsipp; dkim-atps=neutral; spf=pass (client-ip=147.75.193.91; helo=nyc.source.kernel.org; envelope-from=namhyung@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=NV7gsipp;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=147.75.193.91; helo=nyc.source.kernel.org; envelope-from=namhyung@kernel.org; receiver=lists.ozlabs.org)
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Z8Z7t3M58z3bnx
	for <linuxppc-dev@lists.ozlabs.org>; Sat,  8 Mar 2025 05:10:02 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id DACADA4505F;
	Fri,  7 Mar 2025 18:04:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A8EFCC4CED1;
	Fri,  7 Mar 2025 18:09:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741370999;
	bh=ZPh0XZMAKZ/OxkHfLIzsQUuSFUMUkd8ni5QAeKu7Hdw=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=NV7gsippmO62CY4BB1VbpnnOxuaaXykXe4PGo4ltAUs5sROwGVtyYuXMA6Z/EinnU
	 +rwLLZiS/q2EUMhB1zjl7PitHZPJPxmgZKMAE35aZsuQHfTBtW+R8u7E2+XozylEGP
	 s95Z6TVVI6SdfcVMPKAit/MX5FM+yPNn+dXtRaPgEYP1mM1JMq2vBF2bGI2Fg/so5/
	 brzEGBVAsaFxpxKkMjgXgZVX3RJRKlr3FZw92mSPX5QEo5VSmTzB7Mm5ehtdUUbggB
	 hPyd8EQnnqGtUDU6GfdthuoPUlCfJSgz7OXDPKxGoSzS5mpMrmFV+j0VaDNmP+duZO
	 1EtugER5gwW2g==
From: Namhyung Kim <namhyung@kernel.org>
To: acme@kernel.org, jolsa@kernel.org, adrian.hunter@intel.com, 
 irogers@google.com, Athira Rajeev <atrajeev@linux.ibm.com>
Cc: linux-perf-users@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, 
 maddy@linux.ibm.com, kjain@linux.ibm.com, disgoel@linux.vnet.ibm.com, 
 hbathini@linux.vnet.ibm.com, Aditya.Bodkhe1@ibm.com, Tejas.Manhas1@ibm.com
In-Reply-To: <20250304154114.62093-1-atrajeev@linux.ibm.com>
References: <20250304154114.62093-1-atrajeev@linux.ibm.com>
Subject: Re: [PATCH 1/2] tools/perf: Add field to annotation options to
 determine disassembler used
Message-Id: <174137099865.213280.6436963738930640408.b4-ty@kernel.org>
Date: Fri, 07 Mar 2025 10:09:58 -0800
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-c04d2
X-Spam-Status: No, score=-2.7 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

On Tue, 04 Mar 2025 21:11:13 +0530, Athira Rajeev wrote:
> When doing "perf annotate", perf tool provides option to
> use specific disassembler like llvm/objdump/capstone. The
> order picked is to use llvm first and if that fails fallback
> to objdump ie to use PERF_DISASM_LLVM, PERF_DISASM_CAPSTONE
> and PERF_DISASM_OBJDUMP
> 
> In powerpc, when using "data type" sort keys, first preferred
> approach is to read the raw instruction from the DSO. In objdump
> is specified in "--objdump" option, it picks the symbol disassemble
> using objdump. Currently disasm_line__parse_powerpc() function
> uses length of the "line" to determine if objdump is used.
> But there are few cases, where if objdump doesn't recognise the
> instruction, the disassembled string will be empty.
> 
> [...]
Applied to perf-tools-next, thanks!

Best regards,
Namhyung



