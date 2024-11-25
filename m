Return-Path: <linuxppc-dev+bounces-3547-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id D10F29D82DF
	for <lists+linuxppc-dev@lfdr.de>; Mon, 25 Nov 2024 10:52:04 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XxgwK1nHgz2yXY;
	Mon, 25 Nov 2024 20:52:01 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2404:9400:2221:ea00::3"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1732528321;
	cv=none; b=BrVo5xnfOhq5gwruwNWm+vFpziwUj8iFPrJoEfmLp0qIFSWejTPUXvAv6h9ihxgdR2WW6T27f3rWupDBGiwIkOl20ZtYW0wdSQKuFHMyeuxe1oQCnrWgsk2cIaAaRNh9ucSwI3fV+5mukrtBTowLsMwtbAMKSRS+d5cg/JXfubQ24YmTuLNqmDuvUr1MPnDxtPMMdMvUmwiFtz3Uu1BvYgovedEqZ8GGNaCpApL/s3qwPLsgGI+i5bHA8LvKBOVO+YiaR/sDTag2sRHaMKi9FDgAh3Edy53k47T31AK0UXIN247Il3RNUAbu5o1gbHewtNS91X2gu4p6ZKI6YedbpA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1732528321; c=relaxed/relaxed;
	bh=W17ODsVUBbeuUGeZ10b75zm4ShxazurX/hoPZOcbtUU=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=EUp1IfzUECN0e3Mj36GZ9t07Gm4uRfr3U/1Yg1kgjuWuH7AAZARu2FALQ3R+eE7hI1Q/ZCAv1IGDF5S9lRAV7L/6slIoDinl2VkSnmrmof2CZ5TKhKRzsMKv0kcfAFHhHFBr/m9MkUeQWknhXfWReVgpa+kr1S9lZdgzTabzoiRTIjIjwA1ByZMQfsTFRltDZxlzxBn/PaiDMMknZ7vkZEzpw3endVHyxdMOd7cQj7k+iSGkG/5byafYUhFVya/SbLCLUiEAAP2Wbl2dEUc07VVpQ9qOuq5JstrahSxcRsPO5LLL6RxBnjIqEaKUuxURNkVzZy/j8dUgdbRa/Qzmww==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=ellerman.id.au; dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=ctkDl04E; dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=ellerman.id.au
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=ctkDl04E;
	dkim-atps=neutral
Received: from mail.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XxgwH119Kz2xvh
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 25 Nov 2024 20:51:59 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
	s=201909; t=1732528312;
	bh=W17ODsVUBbeuUGeZ10b75zm4ShxazurX/hoPZOcbtUU=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=ctkDl04EqId3rnxM2pxDPeCBnv2zZdQQBpgSRgy6CWzTsz+6Wm63ggTsFj5/uLA4f
	 KCqVjauVuKeVYaU6k2JE263ulLikjDMMo5c0kcT/6kMjgHx9/69pl0fO//VCfw+76R
	 2qxr2tgCHZEy7E0QIwPIekn9FZviMDzZ+zKFigIJTThicB8/AL6DLd4jYf4JkzQ+zE
	 lLR5tY1h58LiRUl739/IuuRcRQZszswF534nMoU4OMvHJU+nNDobCNr+PWiReozKog
	 9mYDkfDIuqc5LjZQY3aNCHRJaD6QksN2KVyK5ZKOaCcBNDOxwXLxePV3+difFHra40
	 0HMGlKy1i3pOQ==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4Xxgw7739cz4wcl;
	Mon, 25 Nov 2024 20:51:51 +1100 (AEDT)
From: Michael Ellerman <patch-notifications@ellerman.id.au>
To: mpe@ellerman.id.au, maddy@linux.ibm.com, Kajol Jain <kjain@linux.ibm.com>
Cc: atrajeev@linux.ibm.com, disgoel@linux.ibm.com, hbathini@linux.ibm.com, adubey@linux.ibm.com, gautam@linux.ibm.com, linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
In-Reply-To: <20241118114114.208964-1-kjain@linux.ibm.com>
References: <20241118114114.208964-1-kjain@linux.ibm.com>
Subject: Re: [PATCH v2 1/4] powerpc/perf: Add perf interface to expose vpa counters
Message-Id: <173252811444.21628.12440486222301252758.b4-ty@ellerman.id.au>
Date: Mon, 25 Nov 2024 20:48:34 +1100
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

On Mon, 18 Nov 2024 17:11:11 +0530, Kajol Jain wrote:
> To support performance measurement for KVM on PowerVM(KoP)
> feature, PowerVM hypervisor has added couple of new software
> counters in Virtual Process Area(VPA) of the partition.
> 
> Commit e1f288d2f9c69 ("KVM: PPC: Book3S HV nestedv2: Add
> support for reading VPA counters for pseries guests")
> have updated the paca fields with corresponding changes.
> 
> [...]

Applied to powerpc/next.

[1/4] powerpc/perf: Add perf interface to expose vpa counters
      https://git.kernel.org/powerpc/c/176cda0619b6c17a553625f6e2fcbc3981ad667d
[2/4] docs: ABI: sysfs-bus-event_source-devices-vpa-pmu: Document sysfs event format entries for vpa_pmu
      https://git.kernel.org/powerpc/c/4ae0b32ecee730a41f65eb122bbb40fda7dca34a
[3/4] powerpc/kvm: Add vpa latency counters to kvm_vcpu_arch
      https://git.kernel.org/powerpc/c/5f0b48c6a168994cc09d02888c2d939eba2af193
[4/4] powerpc/perf: Add per-task/process monitoring to vpa_pmu driver
      https://git.kernel.org/powerpc/c/f26f9933e3e31b2117b804b6b8932388db88a131

cheers

