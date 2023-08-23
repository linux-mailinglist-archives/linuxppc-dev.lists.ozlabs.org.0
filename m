Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 3EC177857C3
	for <lists+linuxppc-dev@lfdr.de>; Wed, 23 Aug 2023 14:16:48 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RW4vf1N6Dz3hc1
	for <lists+linuxppc-dev@lfdr.de>; Wed, 23 Aug 2023 22:16:46 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RW4d415QQz3cHP
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 23 Aug 2023 22:04:08 +1000 (AEST)
Received: by gandalf.ozlabs.org (Postfix)
	id 4RW4d40gKkz4x2L; Wed, 23 Aug 2023 22:04:08 +1000 (AEST)
Delivered-To: linuxppc-dev@ozlabs.org
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4RW4d36fb2z4wy7;
	Wed, 23 Aug 2023 22:04:07 +1000 (AEST)
From: Michael Ellerman <patch-notifications@ellerman.id.au>
To: linuxppc-dev <linuxppc-dev@ozlabs.org>, Mahesh Salgaonkar <mahesh@linux.ibm.com>
In-Reply-To: <169235811556.193557.1023625262204809514.stgit@jupiter>
References: <169235811556.193557.1023625262204809514.stgit@jupiter>
Subject: Re: [PATCH v9 1/2] powerpc/rtas: export rtas_error_rc() for reuse.
Message-Id: <169279175579.797584.15043748481336876672.b4-ty@ellerman.id.au>
Date: Wed, 23 Aug 2023 21:55:55 +1000
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
Cc: Nathan Lynch <nathanl@linux.ibm.com>, Tyrel Datwyler <tyreld@linux.ibm.com>, linux-pci <linux-pci@vger.kernel.org>, Linux Kernel <linux-kernel@vger.kernel.org>, Oliver O'Halloran <oohall@gmail.com>, Bjorn Helgaas <bhelgaas@google.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, 18 Aug 2023 16:59:07 +0530, Mahesh Salgaonkar wrote:
> Also, #define descriptive names for common rtas return codes and use it
> instead of numeric values.
> 
> 

Applied to powerpc/next.

[1/2] powerpc/rtas: export rtas_error_rc() for reuse.
      https://git.kernel.org/powerpc/c/e160bf64e2d3df7bf83ed41d09390a32490be6c5
[2/2] PCI: rpaphp: Error out on busy status from get-sensor-state
      https://git.kernel.org/powerpc/c/77583f77ed9b1452ac62caebf09b2206da10bbf9

cheers
