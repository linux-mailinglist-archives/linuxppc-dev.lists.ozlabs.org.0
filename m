Return-Path: <linuxppc-dev+bounces-3356-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F8AD9D0364
	for <lists+linuxppc-dev@lfdr.de>; Sun, 17 Nov 2024 13:04:30 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XrqDg5pckz2yDT;
	Sun, 17 Nov 2024 23:04:19 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2404:9400:2221:ea00::3"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1731845059;
	cv=none; b=Bf5105qMKRA+PYGKRabMg/iMUbdH7mQTw7V8h4GNmbMY+jNyeYEULJfmkHeeWQeBuNBRqKIrz6RoomBkvCHOQHksHsdBR8zwQwnKFoILMmyI4O9BPRX8DlI9DDn5MmJCZ133RjwiXeEO/YnBd8OV031lzbDNqiv+TKL+XWowr/F5CBvuQpBllPubnEXdW8iq9qw9LEV6oIW0/UWpiKb/bFQm+5NDog8+EaldyNXe0BOytdXKhxrNjlO2Onsv9y4+AmAI0+ZdHsfTMJeH/IDrQGvEV0IPMzFFxT12DmQU6TS0OWekYngCoqWTysaKkYLRrzb9Mq+qiNxWRn6qYSriAg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1731845059; c=relaxed/relaxed;
	bh=iDLBEcPLnsdBaxtgoBm6ijM1a0dYsIecpZLlCOdfoe4=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=ZA3xNSwnt0hQrs2JzYhlLCIY7alY9O5UuuDbgF1BHVp/z566OxxfGFJlsmaMARbT+zJzuFwpu2ZsZLZCI3moNMuig8XKcBvEWYgiCT3V1poS4FM7mvK5b08AX59JYy/QCmmR5abbOzpKFIJpdubAy//hVSjBAVBHWPhf7Ym7D9eGC5gcVpCQW+dRMMYTi2DSkZ4+HqeH5Jj7qGajb7nM6CkUwXcuouiJailZiSeQGXXiOu8CnDqsjOCmR0KkERc1DLVa53kOwAFqeVA0uXunRNyeat23xVXMmByT5m0LLzYVr/iia4Ppnl8rYP0kkHFEfNqNZXsaKYDIK+91kQA8aA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=ellerman.id.au; dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=O/nK4pOx; dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=ellerman.id.au
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=O/nK4pOx;
	dkim-atps=neutral
Received: from mail.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XrqDg0KBPz2y8k
	for <linuxppc-dev@lists.ozlabs.org>; Sun, 17 Nov 2024 23:04:19 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
	s=201909; t=1731845056;
	bh=iDLBEcPLnsdBaxtgoBm6ijM1a0dYsIecpZLlCOdfoe4=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=O/nK4pOxgHaTKX6JcezklCGDvhMmAeuaeDbUvf9fi+KBI9sq5pP6tYnjGF0D1mpFF
	 3FgbS7McyJIiQpQzeIwi2nMKKRD0WsgySmi4Z5ss6DuxLZxnyBPlde7QxD6yT1Zcxv
	 K2LDbp5mQL+b60gFavsa9qQ5nn1sw5twvwBrY7lOIh84+e1ZQyISAgD54bpaqnWiRI
	 4Qi2KYBKXrEyDLPgPUhEBpylGVixQTb9eSISdosYCk/vVYmOpzJL9SHNb5mpKR2RPB
	 LUkKiVQ+fSj9zAom+RymQ/k84Vx/UnwlaGkwK6iEAEJHq/LBkuU4/RIpiqXlbCI/7s
	 YY+ZiEqsF0BRg==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4XrqDb6Rh2z4xdT;
	Sun, 17 Nov 2024 23:04:15 +1100 (AEDT)
From: Michael Ellerman <patch-notifications@ellerman.id.au>
To: mpe@ellerman.id.au, npiggin@gmail.com, christophe.leroy@csgroup.eu, naveen@kernel.org, maddy@linux.ibm.com, vaibhav@linux.ibm.com, Gautam Menghani <gautam@linux.ibm.com>
Cc: linuxppc-dev@lists.ozlabs.org, kvm@vger.kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <20241109063301.105289-1-gautam@linux.ibm.com>
References: <20241109063301.105289-1-gautam@linux.ibm.com>
Subject: Re: [PATCH 0/3] Fix doorbell emulation for nested KVM guests in V1 API
Message-Id: <173184457526.887714.4884403618372389811.b4-ty@ellerman.id.au>
Date: Sun, 17 Nov 2024 22:56:15 +1100
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
X-Spam-Status: No, score=-2.5 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_PASS,SPF_PASS
	autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

On Sat, 09 Nov 2024 12:02:54 +0530, Gautam Menghani wrote:
> Doorbell emulation for nested KVM guests in V1 API is broken because of
> 2 reasons:
> 1. L0 presenting H_EMUL_ASSIST to L1 instead of H_FAC_UNAVAIL
> 2. Broken plumbing for passing around doorbell state.
> 
> Fix the trap passed to L1 and the plumbing for maintaining doorbell
> state.
> 
> [...]

Applied to powerpc/topic/ppc-kvm.

[1/3] Revert "KVM: PPC: Book3S HV Nested: Stop forwarding all HFUs to L1"
      https://git.kernel.org/powerpc/c/ed351c57432122c4499be4f4aee8711d6fa93f3b
[2/3] KVM: PPC: Book3S HV: Stop using vc->dpdes for nested KVM guests
      https://git.kernel.org/powerpc/c/0d3c6b28896f9889c8864dab469e0343a0ad1c0c
[3/3] KVM: PPC: Book3S HV: Avoid returning to nested hypervisor on pending doorbells
      https://git.kernel.org/powerpc/c/26686db69917399fa30e3b3135360771e90f83ec

cheers

