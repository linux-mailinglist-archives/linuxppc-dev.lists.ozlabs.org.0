Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id ED36A68AF1A
	for <lists+linuxppc-dev@lfdr.de>; Sun,  5 Feb 2023 10:47:13 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4P8l0c49vtz3fXY
	for <lists+linuxppc-dev@lfdr.de>; Sun,  5 Feb 2023 20:46:56 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4P8kvW3flbz3f4r
	for <linuxppc-dev@lists.ozlabs.org>; Sun,  5 Feb 2023 20:42:31 +1100 (AEDT)
Received: by gandalf.ozlabs.org (Postfix)
	id 4P8kvS5Dhdz4xyy; Sun,  5 Feb 2023 20:42:28 +1100 (AEDT)
Delivered-To: linuxppc-dev@ozlabs.org
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4P8kvS4MVTz4xyt;
	Sun,  5 Feb 2023 20:42:28 +1100 (AEDT)
From: Michael Ellerman <patch-notifications@ellerman.id.au>
To: mpe@ellerman.id.au, Sourabh Jain <sourabhjain@linux.ibm.com>, linuxppc-dev@ozlabs.org
In-Reply-To: <20230131030615.729894-1-sourabhjain@linux.ibm.com>
References: <20230131030615.729894-1-sourabhjain@linux.ibm.com>
Subject: Re: [PATCH v2] powerpc/kexec_file: account hot-pluggable memory while estimating FDT size
Message-Id: <167559011069.1647710.15697754175763092162.b4-ty@ellerman.id.au>
Date: Sun, 05 Feb 2023 20:41:50 +1100
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
Cc: mahesh@linux.vnet.ibm.com, hbathini@linux.ibm.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, 31 Jan 2023 08:36:15 +0530, Sourabh Jain wrote:
> On Systems where online memory is lesser compared to max memory, the
> kexec_file_load system call may fail to load the kdump kernel with the
> below errors:
> 
>     "Failed to update fdt with linux,drconf-usable-memory property"
>     "Error setting up usable-memory property for kdump kernel"
> 
> [...]

Applied to powerpc/fixes.

[1/1] powerpc/kexec_file: account hot-pluggable memory while estimating FDT size
      https://git.kernel.org/powerpc/c/fc546faa559538fb312c77e055243ece18ab3288

cheers
