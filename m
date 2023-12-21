Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A78681B455
	for <lists+linuxppc-dev@lfdr.de>; Thu, 21 Dec 2023 11:50:16 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4SwnJQ1DDvz75hf
	for <lists+linuxppc-dev@lfdr.de>; Thu, 21 Dec 2023 21:50:14 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4SwnGZ3tCjz3wVR
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 21 Dec 2023 21:48:38 +1100 (AEDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4SwnGZ30W8z4xgv;
	Thu, 21 Dec 2023 21:48:38 +1100 (AEDT)
From: Michael Ellerman <patch-notifications@ellerman.id.au>
To: linuxppc-dev@lists.ozlabs.org, Haren Myneni <haren@linux.ibm.com>
In-Reply-To: <20231125235104.3405008-1-haren@linux.ibm.com>
References: <20231125235104.3405008-1-haren@linux.ibm.com>
Subject: Re: [PATCH v5] powerpc/pseries/vas: Migration suspend waits for no in-progress open windows
Message-Id: <170315561639.2199281.3008944679696351086.b4-ty@ellerman.id.au>
Date: Thu, 21 Dec 2023 21:46:56 +1100
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
Cc: nathanl@linux.ibm.com, npiggin@gmail.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Sat, 25 Nov 2023 15:51:04 -0800, Haren Myneni wrote:
> The hypervisor returns migration failure if all VAS windows are not
> closed. During pre-migration stage, vas_migration_handler() sets
> migration_in_progress flag and closes all windows from the list.
> The allocate VAS window routine checks the migration flag, setup
> the window and then add it to the list. So there is possibility of
> the migration handler missing the window that is still in the
> process of setup.
> 
> [...]

Applied to powerpc/fixes.

[1/1] powerpc/pseries/vas: Migration suspend waits for no in-progress open windows
      https://git.kernel.org/powerpc/c/0cf72f7f14d12cb065c3d01954cf42fc5638aa69

cheers
