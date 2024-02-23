Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id B6329861B1F
	for <lists+linuxppc-dev@lfdr.de>; Fri, 23 Feb 2024 19:05:44 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ThHxF0HY9z3vc2
	for <lists+linuxppc-dev@lfdr.de>; Sat, 24 Feb 2024 05:05:37 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=145.40.73.55; helo=sin.source.kernel.org; envelope-from=srs0=wkxo=ka=goodmis.org=rostedt@kernel.org; receiver=lists.ozlabs.org)
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4ThHwk3wdHz3dVx;
	Sat, 24 Feb 2024 05:05:10 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id CC73ECE2E24;
	Fri, 23 Feb 2024 18:05:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 370BEC433C7;
	Fri, 23 Feb 2024 18:05:01 +0000 (UTC)
Date: Fri, 23 Feb 2024 13:06:53 -0500
From: Steven Rostedt <rostedt@goodmis.org>
To: LKML <linux-kernel@vger.kernel.org>, Linux Trace Kernel
 <linux-trace-kernel@vger.kernel.org>
Subject: Re: [FYI][PATCH] tracing/treewide: Remove second parameter of
 __assign_str()
Message-ID: <20240223130653.2cc317a8@gandalf.local.home>
In-Reply-To: <20240223125634.2888c973@gandalf.local.home>
References: <20240223125634.2888c973@gandalf.local.home>
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
Cc: linux-hyperv@vger.kernel.org, kvm@vger.kernel.org, dri-devel@lists.freedesktop.org, ath10k@lists.infradead.org, Julia Lawall <Julia.Lawall@inria.fr>, linux-s390@vger.kernel.org, dev@openvswitch.org, linux-cifs@vger.kernel.org, linux-bcachefs@vger.kernel.org, linux-rdma@vger.kernel.org, amd-gfx@lists.freedesktop.org, io-uring@vger.kernel.org, Linus Torvalds <torvalds@linux-foundation.org>, iommu@lists.linux.dev, ath11k@lists.infradead.org, linux-media@vger.kernel.org, linux-wpan@vger.kernel.org, linux-pm@vger.kernel.org, selinux@vger.kernel.org, linux-arm-msm@vger.kernel.org, intel-gfx@lists.freedesktop.org, linux-erofs@lists.ozlabs.org, virtualization@lists.linux.dev, linux-sound@vger.kernel.org, linux-block@vger.kernel.org, ocfs2-devel@lists.linux.dev, Mathieu Desnoyers <mathieu.desnoyers@efficios.com>, linux-cxl@vger.kernel.org, linux-tegra@vger.kernel.org, intel-xe@lists.freedesktop.org, linux-edac@vger.kernel.org, linux-hwmon@vger.kernel.org, brcm80211-dev-list.pdl@broadcom.c
 om, linuxppc-dev@lists.ozlabs.org, linux-usb@vger.kernel.org, linux-wireless@vger.kernel.org, brcm80211@lists.linux.dev, linux-f2fs-devel@lists.sourceforge.net, linux-xfs@vger.kernel.org, ath12k@lists.infradead.org, tipc-discussion@lists.sourceforge.net, Masami Hiramatsu <mhiramat@kernel.org>, netdev@vger.kernel.org, bpf@vger.kernel.org, freedreno@lists.freedesktop.org, linux-nfs@vger.kernel.org, linux-btrfs@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, 23 Feb 2024 12:56:34 -0500
Steven Rostedt <rostedt@goodmis.org> wrote:

> Note, the same updates will need to be done for:
> 
>   __assign_str_len()
>   __assign_rel_str()
>   __assign_rel_str_len()

Correction: The below macros do not pass in their source to the entry
macros, so they will not need to be updated.

-- Steve

>   __assign_bitmask()
>   __assign_rel_bitmask()
>   __assign_cpumask()
>   __assign_rel_cpumask()

