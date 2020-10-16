Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id B3E91290427
	for <lists+linuxppc-dev@lfdr.de>; Fri, 16 Oct 2020 13:35:32 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CCPGV0t8bzDqN6
	for <lists+linuxppc-dev@lfdr.de>; Fri, 16 Oct 2020 22:35:30 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CCPC84N1kzDqcg
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 16 Oct 2020 22:32:36 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Received: by ozlabs.org (Postfix, from userid 1034)
 id 4CCPC72wlBz9sTq; Fri, 16 Oct 2020 22:32:35 +1100 (AEDT)
From: Michael Ellerman <patch-notifications@ellerman.id.au>
To: mpe@ellerman.id.au, "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>,
 linuxppc-dev@lists.ozlabs.org
In-Reply-To: <20201014064813.109515-1-aneesh.kumar@linux.ibm.com>
References: <20201014064813.109515-1-aneesh.kumar@linux.ibm.com>
Subject: Re: [PATCH] powerpc/opal_elog: Handle multiple writes to ack attribute
Message-Id: <160284791841.1794337.13323860774237941486.b4-ty@ellerman.id.au>
Date: Fri, 16 Oct 2020 22:32:35 +1100 (AEDT)
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
Cc: Oliver O'Halloran <oohall@gmail.com>,
 Mahesh Salgaonkar <mahesh@linux.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, 14 Oct 2020 12:18:13 +0530, Aneesh Kumar K.V wrote:
> Even though we use self removing sysfs helper, we still need
> to make sure we do the final kobject delete conditionally.
> sysfs_remove_file_self() will handle parallel calls to remove
> the sysfs attribute file and returns true only in the caller
> that removed the attribute file. The other parallel callers
> are returned false. Do the final kobject delete checking
> the return value of sysfs_remove_file_self().

Applied to powerpc/fixes.

[1/1] powerpc/opal_elog: Handle multiple writes to ack attribute
      https://git.kernel.org/powerpc/c/d4263b12a1a0e8816e021450be0765a1ad8bb53c

cheers
