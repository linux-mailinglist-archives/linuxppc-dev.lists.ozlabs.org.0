Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B8C44D1724
	for <lists+linuxppc-dev@lfdr.de>; Tue,  8 Mar 2022 13:20:14 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KCZCb13b7z3dpl
	for <lists+linuxppc-dev@lfdr.de>; Tue,  8 Mar 2022 23:20:11 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (mail.ozlabs.org
 [IPv6:2404:9400:2221:ea00::3])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KCZ942mfGz3bP0
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  8 Mar 2022 23:18:00 +1100 (AEDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4KCZ9527H4z4xy4;
 Tue,  8 Mar 2022 23:18:01 +1100 (AEDT)
From: Michael Ellerman <patch-notifications@ellerman.id.au>
To: linuxppc-dev@lists.ozlabs.org, kvm-ppc@vger.kernel.org, mpe@ellerman.id.au,
 linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org,
 pratik.r.sampat@gmail.com, shuah@kernel.org,
 "Pratik R. Sampat" <psampat@linux.ibm.com>
In-Reply-To: <20220217105321.52941-1-psampat@linux.ibm.com>
References: <20220217105321.52941-1-psampat@linux.ibm.com>
Subject: Re: [PATCH v9 0/2] Interface to represent PAPR firmware attributes
Message-Id: <164674128970.3322453.9483045885684734218.b4-ty@ellerman.id.au>
Date: Tue, 08 Mar 2022 23:08:09 +1100
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

On Thu, 17 Feb 2022 16:23:19 +0530, Pratik R. Sampat wrote:
> RFC: https://lkml.org/lkml/2021/6/4/791
> PATCH v1: https://lkml.org/lkml/2021/6/16/805
> PATCH v2: https://lkml.org/lkml/2021/7/6/138
> PATCH v3: https://lkml.org/lkml/2021/7/12/2799
> PATCH v4: https://lkml.org/lkml/2021/7/16/532
> PATCH v5: https://lkml.org/lkml/2021/7/19/247
> PATCH v6: https://lkml.org/lkml/2021/7/20/36
> PATCH v7: https://lkml.org/lkml/2021/7/23/26
> PATCH v8: https://lkml.org/lkml/2021/9/28/554
> 
> [...]

Applied to powerpc/next.

[1/2] powerpc/pseries: Interface to represent PAPR firmware attributes
      https://git.kernel.org/powerpc/c/3c14b73454cf9f6e2146443fdfbdfb912c0efed3
[2/2] selftest/powerpc: Add PAPR sysfs attributes sniff test
      https://git.kernel.org/powerpc/c/57201d657eb76d735298405d3200a3b1f67197e1

cheers
