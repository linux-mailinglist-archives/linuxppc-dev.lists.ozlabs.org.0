Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 37C4F5F44D5
	for <lists+linuxppc-dev@lfdr.de>; Tue,  4 Oct 2022 15:53:48 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MhfLf04hqz3fbn
	for <lists+linuxppc-dev@lfdr.de>; Wed,  5 Oct 2022 00:53:46 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Mhf1g74lBz3ds1
	for <linuxppc-dev@lists.ozlabs.org>; Wed,  5 Oct 2022 00:39:03 +1100 (AEDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4Mhf1g61f1z4xGn;
	Wed,  5 Oct 2022 00:39:03 +1100 (AEDT)
From: Michael Ellerman <patch-notifications@ellerman.id.au>
To: linuxppc-dev@lists.ozlabs.org, Michael Ellerman <mpe@ellerman.id.au>
In-Reply-To: <20220930082709.55830-1-mpe@ellerman.id.au>
References: <20220930082709.55830-1-mpe@ellerman.id.au>
Subject: Re: [PATCH v3 1/6] powerpc: Add hardware description string
Message-Id: <166488998856.779920.5754534111893286650.b4-ty@ellerman.id.au>
Date: Wed, 05 Oct 2022 00:26:28 +1100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
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
Cc: nathanl@linux.ibm.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, 30 Sep 2022 18:27:04 +1000, Michael Ellerman wrote:
> Create a hardware description string, which we will use to record
> various details of the hardware platform we are running on.
> 
> Print the accumulated description at boot, and use it to set the generic
> description which is printed in oopses.
> 
> To begin with add ppc_md.name, aka the "machine description".
> 
> [...]

Applied to powerpc/next.

[1/6] powerpc: Add hardware description string
      https://git.kernel.org/powerpc/c/41dc056391b334fae646b55ee020bfa8f67b60c8
[2/6] powerpc: Add PVR & CPU name to hardware description
      https://git.kernel.org/powerpc/c/bd649d40e0f2ffa1e16b4dbb93dc627177410e78
[3/6] powerpc/64: Add logical PVR to the hardware description
      https://git.kernel.org/powerpc/c/48b7019b6abd029d3800620bb53f0ae3ca052441
[4/6] powerpc: Add device-tree model to the hardware description
      https://git.kernel.org/powerpc/c/541229707970ff2ad3f7705b1dbd025d7cc9bc48
[5/6] powerpc/powernv: Add opal details to the hardware description
      https://git.kernel.org/powerpc/c/37576cb0961fe9d3318c17e4e4bc5ecebf38e9bb
[6/6] powerpc/pseries: Add firmware details to the hardware description
      https://git.kernel.org/powerpc/c/8535a1afff0f4f568eb589f3795a930ef3d483b0

cheers
