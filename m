Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FCEB51ED38
	for <lists+linuxppc-dev@lfdr.de>; Sun,  8 May 2022 13:12:40 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Kx1qV39lcz3dQQ
	for <lists+linuxppc-dev@lfdr.de>; Sun,  8 May 2022 21:12:38 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (mail.ozlabs.org
 [IPv6:2404:9400:2221:ea00::3])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Kx1pL49j4z3c8m
 for <linuxppc-dev@lists.ozlabs.org>; Sun,  8 May 2022 21:11:38 +1000 (AEST)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4Kx1pF4Cwdz4xXk;
 Sun,  8 May 2022 21:11:33 +1000 (AEST)
From: Michael Ellerman <patch-notifications@ellerman.id.au>
To: nathanl@linux.ibm.com, mpe@ellerman.id.au, linuxppc-dev@lists.ozlabs.org,
 npiggin@gmail.com, Haren Myneni <haren@linux.ibm.com>
In-Reply-To: <76d156f8af1e03cc09369d68e0bfad0c40031bcc.camel@linux.ibm.com>
References: <76d156f8af1e03cc09369d68e0bfad0c40031bcc.camel@linux.ibm.com>
Subject: Re: [PATCH] powerpc/pseries/vas: Use QoS credits from the userspace
Message-Id: <165200827416.2672957.5309405825160744751.b4-ty@ellerman.id.au>
Date: Sun, 08 May 2022 21:11:14 +1000
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
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Sat, 19 Mar 2022 02:28:09 -0700, Haren Myneni wrote:
> The user can change the QoS credits dynamically with the
> management console interface which notifies OS with sysfs. After
> returning from the OS interface successfully, the management
> console updates the hypervisor. Since the VAS capabilities in
> the hypervisor is not updated when the OS gets the update,
> the kernel is using the old total credits value from the
> hypervisor. Fix this issue by using the new QoS credits
> from the userspace instead of depending on VAS capabilities
> from the hypervisor.
> 
> [...]

Applied to powerpc/fixes.

[1/1] powerpc/pseries/vas: Use QoS credits from the userspace
      https://git.kernel.org/powerpc/c/57831bfb5e78777dc399e351ed68ef77c3aee385

cheers
