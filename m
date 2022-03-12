Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 48D8C4D6E31
	for <lists+linuxppc-dev@lfdr.de>; Sat, 12 Mar 2022 11:34:04 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KFzgG10hYz3dvR
	for <lists+linuxppc-dev@lfdr.de>; Sat, 12 Mar 2022 21:34:02 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (mail.ozlabs.org
 [IPv6:2404:9400:2221:ea00::3])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KFzbd4hMPz30CL
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 12 Mar 2022 21:30:53 +1100 (AEDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4KFzbd3Wx0z4xj7;
 Sat, 12 Mar 2022 21:30:53 +1100 (AEDT)
From: Michael Ellerman <patch-notifications@ellerman.id.au>
To: Rohan McLure <rmclure@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org
In-Reply-To: <20220307231414.86560-1-rmclure@linux.ibm.com>
References: <20220307231414.86560-1-rmclure@linux.ibm.com>
Subject: Re: [PATCH v3] powerpc: declare unmodified attribute_group usages
 const
Message-Id: <164708098702.827774.12535551676316210179.b4-ty@ellerman.id.au>
Date: Sat, 12 Mar 2022 21:29:47 +1100
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

On Tue, 8 Mar 2022 10:14:14 +1100, Rohan McLure wrote:
> Inspired by (bd75b4ef4977: Constify static attribute_group structs),
> accepted by linux-next, reported:
> https://patchwork.ozlabs.org/project/linuxppc-dev/patch/20220210202805.7750-4-rikard.falkeborn@gmail.com/
> 
> Nearly all singletons of type struct attribute_group are never
> modified, and so
> are candidates for being const. Declare them as const.
> 
> [...]

Applied to powerpc/next.

[1/1] powerpc: declare unmodified attribute_group usages const
      https://git.kernel.org/powerpc/c/6b3a3e12f8e6eea47428bb39aaf58832b50bb379

cheers
