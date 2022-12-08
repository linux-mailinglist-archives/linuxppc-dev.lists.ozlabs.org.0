Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 4726164700C
	for <lists+linuxppc-dev@lfdr.de>; Thu,  8 Dec 2022 13:51:06 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NSYtJ1ddGz3fCn
	for <lists+linuxppc-dev@lfdr.de>; Thu,  8 Dec 2022 23:51:04 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4NSYrf3w9vz2xKX
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  8 Dec 2022 23:49:38 +1100 (AEDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4NSYrZ0Zg9z4xN1;
	Thu,  8 Dec 2022 23:49:34 +1100 (AEDT)
From: Michael Ellerman <patch-notifications@ellerman.id.au>
To: rafael@kernel.org, npiggin@gmail.com, Aboorva Devarajan <aboorvad@linux.vnet.ibm.com>, mpe@ellerman.id.au, daniel.lezcano@linaro.org, svaidy@linux.vnet.ibm.com
In-Reply-To: <20221114145611.37669-1-aboorvad@linux.vnet.ibm.com>
References: <20221114073154.30407-1-aboorvad@linux.vnet.ibm.com> <20221114145611.37669-1-aboorvad@linux.vnet.ibm.com>
Subject: Re: [PATCH v2] powerpc/cpuidle: Set CPUIDLE_FLAG_POLLING for snooze state
Message-Id: <167050321754.1457988.14917789901150069869.b4-ty@ellerman.id.au>
Date: Thu, 08 Dec 2022 23:40:17 +1100
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
Cc: linuxppc-dev@lists.ozlabs.org, srikar@linux.vnet.ibm.com, linux-pm@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, 14 Nov 2022 20:26:11 +0530, Aboorva Devarajan wrote:
> During the comparative study of cpuidle governors, it is noticed that the
> menu governor does not select CEDE state in some scenarios even though when
> the sleep duration of the CPU exceeds the target residency of the CEDE idle
> state this is because the CPU exits the snooze "polling" state when snooze
> time limit is reached in the snooze_loop(), which is not a real wake up
> and it just means that the polling state selection was not adequate.
> 
> [...]

Applied to powerpc/next.

[1/1] powerpc/cpuidle: Set CPUIDLE_FLAG_POLLING for snooze state
      https://git.kernel.org/powerpc/c/5ddcc03a07ae1ab5062f89a946d9495f1fd8eaa4

cheers
