Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id DE17963D263
	for <lists+linuxppc-dev@lfdr.de>; Wed, 30 Nov 2022 10:47:55 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NMZBd69Mkz3gx5
	for <lists+linuxppc-dev@lfdr.de>; Wed, 30 Nov 2022 20:47:53 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4NMYtg3JVKz3fQ1
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 30 Nov 2022 20:34:03 +1100 (AEDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4NMYtg00tCz4xvP;
	Wed, 30 Nov 2022 20:34:02 +1100 (AEDT)
From: Michael Ellerman <patch-notifications@ellerman.id.au>
To: linuxppc-dev@lists.ozlabs.org, Russell Currey <ruscur@russell.cc>
In-Reply-To: <20221024041346.103608-1-ruscur@russell.cc>
References: <20221024041346.103608-1-ruscur@russell.cc>
Subject: Re: [PATCH] powerpc/8xx: Fix warning in hw_breakpoint_handler()
Message-Id: <166980025260.3017288.11889101044901537576.b4-ty@ellerman.id.au>
Date: Wed, 30 Nov 2022 20:24:12 +1100
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
Cc: ravi.bangoria@linux.ibm.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, 24 Oct 2022 15:13:46 +1100, Russell Currey wrote:
> In hw_breakpoint_handler(), ea is set by wp_get_instr_detail() except
> for 8xx, leading the variable to be passed uninitialised to
> wp_check_constraints().  This is safe as wp_check_constraints() returns
> early without using ea, so just set it to make the compiler happy.
> 
> 

Applied to powerpc/next.

[1/1] powerpc/8xx: Fix warning in hw_breakpoint_handler()
      https://git.kernel.org/powerpc/c/f668027521561d1071ccf54500c82a58a1918b2b

cheers
