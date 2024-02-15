Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id BBD2C8563EE
	for <lists+linuxppc-dev@lfdr.de>; Thu, 15 Feb 2024 14:03:47 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TbFcd5CCgz3w9x
	for <lists+linuxppc-dev@lfdr.de>; Fri, 16 Feb 2024 00:03:45 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4TbFX92w2fz3dX4
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 15 Feb 2024 23:59:53 +1100 (AEDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4TbFX91c8xz4x0r;
	Thu, 15 Feb 2024 23:59:53 +1100 (AEDT)
From: Michael Ellerman <patch-notifications@ellerman.id.au>
To: npiggin@gmail.com, Shrikanth Hegde <sshegde@linux.ibm.com>
In-Reply-To: <20240213052635.231597-1-sshegde@linux.ibm.com>
References: <20240213052635.231597-1-sshegde@linux.ibm.com>
Subject: Re: [PATCH] powerpc/pseries: fix accuracy of stolen time
Message-Id: <170800185786.599237.4673706342669525241.b4-ty@ellerman.id.au>
Date: Thu, 15 Feb 2024 23:57:37 +1100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
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
Cc: aneesh.kumar@kernel.org, naveen.n.rao@linux.ibm.com, linuxppc-dev@lists.ozlabs.org, srikar@linux.vnet.ibm.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, 13 Feb 2024 10:56:35 +0530, Shrikanth Hegde wrote:
> powerVM hypervisor updates the VPA fields with stolen time data.
> It currently reports enqueue_dispatch_tb and ready_enqueue_tb for
> this purpose. In linux these two fields are used to report the stolen time.
> 
> The VPA fields are updated at the TB frequency. On powerPC its mostly
> set at 512Mhz. Hence this needs a conversion to ns when reporting it
> back as rest of the kernel timings are in ns. This conversion is already
> handled in tb_to_ns function. So use that function to report accurate
> stolen time.
> 
> [...]

Applied to powerpc/fixes.

[1/1] powerpc/pseries: fix accuracy of stolen time
      https://git.kernel.org/powerpc/c/cbecc9fcbbec60136b0180ba0609c829afed5c81

cheers
