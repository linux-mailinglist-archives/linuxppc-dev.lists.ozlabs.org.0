Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id B88277CE970
	for <lists+linuxppc-dev@lfdr.de>; Wed, 18 Oct 2023 22:52:47 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4S9jj86dtbz3vYc
	for <lists+linuxppc-dev@lfdr.de>; Thu, 19 Oct 2023 07:52:44 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=139.178.84.217; helo=dfw.source.kernel.org; envelope-from=srs0=xy8f=ga=goodmis.org=rostedt@kernel.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4S9jhc4K13z3c5H
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 19 Oct 2023 07:52:16 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id A84E561917;
	Wed, 18 Oct 2023 20:52:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0BCE0C433C8;
	Wed, 18 Oct 2023 20:52:10 +0000 (UTC)
Date: Wed, 18 Oct 2023 16:52:08 -0400
From: Steven Rostedt <rostedt@goodmis.org>
To: kernel test robot <lkp@intel.com>
Subject: Re: [linux-next:master] BUILD REGRESSION
 2dac75696c6da3c848daa118a729827541c89d33
Message-ID: <20231018165208.5267a9b9@gandalf.local.home>
In-Reply-To: <202310190456.pryB092r-lkp@intel.com>
References: <202310190456.pryB092r-lkp@intel.com>
X-Mailer: Claws Mail 3.19.1 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
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
Cc: linux-arch@vger.kernel.org, linux-s390@vger.kernel.org, kvm@vger.kernel.org, linux-rockchip@lists.infradead.org, linux-arm-msm@vger.kernel.org, amd-gfx@lists.freedesktop.org, Linux Memory Management List <linux-mm@kvack.org>, linux-fsdevel@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>, linuxppc-dev@lists.ozlabs.org, linux-trace-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, 19 Oct 2023 04:07:35 +0800
kernel test robot <lkp@intel.com> wrote:

> Documentation/devicetree/bindings/mfd/qcom,tcsr.yaml:
> Documentation/devicetree/bindings/mfd/qcom-pm8xxx.yaml:
> fs/tracefs/event_inode.c:782:11-21: ERROR: ei is NULL but dereferenced.

This was already reported and I'm currently testing a patch to fix it.

-- Steve
