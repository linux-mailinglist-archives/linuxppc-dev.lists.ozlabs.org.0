Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 56BC378E54C
	for <lists+linuxppc-dev@lfdr.de>; Thu, 31 Aug 2023 06:07:27 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RbngK1Sq1z3dlG
	for <lists+linuxppc-dev@lfdr.de>; Thu, 31 Aug 2023 14:07:25 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RbncJ33jsz2xdb
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 31 Aug 2023 14:04:48 +1000 (AEST)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4RbncJ0hVkz4x2W;
	Thu, 31 Aug 2023 14:04:48 +1000 (AEST)
From: Michael Ellerman <patch-notifications@ellerman.id.au>
To: gregkh@linuxfoundation.org, mirimmad@outlook.com
In-Reply-To: <CY5PR12MB64553EE96EBB3927311DB598C6459@CY5PR12MB6455.namprd12.prod.outlook.com>
References: <CY5PR12MB64553EE96EBB3927311DB598C6459@CY5PR12MB6455.namprd12.prod.outlook.com>
Subject: Re: [PATCH] powerpc: fix debugfs_create_dir error checking
Message-Id: <169345455026.11824.17837854226293688534.b4-ty@ellerman.id.au>
Date: Thu, 31 Aug 2023 14:02:30 +1000
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
Cc: Ivan Orlov <ivan.orlov0322@gmail.com>, linux-kernel@vger.kernel.org, Nicholas Piggin <npiggin@gmail.com>, linuxppc-dev@lists.ozlabs.org, Immad Mir <mirimmad17@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Sun, 28 May 2023 13:16:44 +0530, mirimmad@outlook.com wrote:
> The debugfs_create_dir returns ERR_PTR incase of an error and the
> correct way of checking it by using the IS_ERR inline function, and
> not the simple null comparision. This patch fixes this.
> 
> 

Applied to powerpc/next.

[1/1] powerpc: fix debugfs_create_dir error checking
      https://git.kernel.org/powerpc/c/429356fac0440b962aaa6d3688709813a21dd122

cheers
