Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B186A3F20
	for <lists+linuxppc-dev@lfdr.de>; Fri, 30 Aug 2019 22:49:12 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46Ks5w1SkrzDqSM
	for <lists+linuxppc-dev@lfdr.de>; Sat, 31 Aug 2019 06:49:08 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=kernel.org
 (client-ip=198.145.29.99; helo=mail.kernel.org;
 envelope-from=srs0=slzo=w2=goodmis.org=rostedt@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=goodmis.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46Ks3f3yGSzDqhs
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 31 Aug 2019 06:47:10 +1000 (AEST)
Received: from gandalf.local.home (cpe-66-24-58-225.stny.res.rr.com
 [66.24.58.225])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 1104523439;
 Fri, 30 Aug 2019 20:47:07 +0000 (UTC)
Date: Fri, 30 Aug 2019 16:47:06 -0400
From: Steven Rostedt <rostedt@goodmis.org>
To: "Naveen N. Rao" <naveen.n.rao@linux.vnet.ibm.com>
Subject: Re: [PATCH 1/2] ftrace: Fix NULL pointer dereference in t_probe_next()
Message-ID: <20190830164706.453a119e@gandalf.local.home>
In-Reply-To: <05e021f757625cbbb006fad41380323dbe4e3b43.1562249521.git.naveen.n.rao@linux.vnet.ibm.com>
References: <cover.1562249521.git.naveen.n.rao@linux.vnet.ibm.com>
 <05e021f757625cbbb006fad41380323dbe4e3b43.1562249521.git.naveen.n.rao@linux.vnet.ibm.com>
X-Mailer: Claws Mail 3.17.3 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable
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
Cc: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu,  4 Jul 2019 20:04:41 +0530
"Naveen N. Rao" <naveen.n.rao@linux.vnet.ibm.com> wrote:


>  kernel/trace/ftrace.c | 4 ++++
>  1 file changed, 4 insertions(+)
>=20
> diff --git a/kernel/trace/ftrace.c b/kernel/trace/ftrace.c
> index 7b037295a1f1..0791eafb693d 100644
> --- a/kernel/trace/ftrace.c
> +++ b/kernel/trace/ftrace.c
> @@ -3093,6 +3093,10 @@ t_probe_next(struct seq_file *m, loff_t *pos)
>  		hnd =3D &iter->probe_entry->hlist;
> =20
>  	hash =3D iter->probe->ops.func_hash->filter_hash;
> +
> +	if (!hash)
> +		return NULL;
> +
>  	size =3D 1 << hash->size_bits;
> =20
>   retry:

OK, I added this, but I'm also adding this on top:

-- Steve

=46rom 372e0d01da71c84dcecf7028598a33813b0d5256 Mon Sep 17 00:00:00 2001
From: "Steven Rostedt (VMware)" <rostedt@goodmis.org>
Date: Fri, 30 Aug 2019 16:30:01 -0400
Subject: [PATCH] ftrace: Check for empty hash and comment the race with
 registering probes

The race between adding a function probe and reading the probes that exist
is very subtle. It needs a comment. Also, the issue can also happen if the
probe has has the EMPTY_HASH as its func_hash.

Cc: stable@vger.kernel.org
Fixes: 7b60f3d876156 ("ftrace: Dynamically create the probe ftrace_ops for =
the trace_array")
Signed-off-by: Steven Rostedt (VMware) <rostedt@goodmis.org>
---
 kernel/trace/ftrace.c | 10 +++++++++-
 1 file changed, 9 insertions(+), 1 deletion(-)

diff --git a/kernel/trace/ftrace.c b/kernel/trace/ftrace.c
index 80beed2cf0da..6200a6fe10e3 100644
--- a/kernel/trace/ftrace.c
+++ b/kernel/trace/ftrace.c
@@ -3096,7 +3096,11 @@ t_probe_next(struct seq_file *m, loff_t *pos)
=20
 	hash =3D iter->probe->ops.func_hash->filter_hash;
=20
-	if (!hash)
+	/*
+	 * A probe being registered may temporarily have an empty hash
+	 * and it's at the end of the func_probes list.
+	 */
+	if (!hash || hash =3D=3D EMPTY_HASH)
 		return NULL;
=20
 	size =3D 1 << hash->size_bits;
@@ -4324,6 +4328,10 @@ register_ftrace_function_probe(char *glob, struct tr=
ace_array *tr,
=20
 	mutex_unlock(&ftrace_lock);
=20
+	/*
+	 * Note, there's a small window here that the func_hash->filter_hash
+	 * may be NULL or empty. Need to be carefule when reading the loop.
+	 */
 	mutex_lock(&probe->ops.func_hash->regex_lock);
=20
 	orig_hash =3D &probe->ops.func_hash->filter_hash;
--=20
2.20.1

