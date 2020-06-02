Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id D89871EBA57
	for <lists+linuxppc-dev@lfdr.de>; Tue,  2 Jun 2020 13:25:24 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49bqTZ0G9VzDqVp
	for <lists+linuxppc-dev@lfdr.de>; Tue,  2 Jun 2020 21:25:22 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49bqRV6HY1zDqTF
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  2 Jun 2020 21:23:34 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au
 header.a=rsa-sha256 header.s=201909 header.b=N2K4AQ+L; 
 dkim-atps=neutral
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 49bqRS1wsTz9sSc;
 Tue,  2 Jun 2020 21:23:31 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ellerman.id.au;
 s=201909; t=1591097014;
 bh=eGpanG34MNWJ0lGXSXJ8lLK/A/KPEElEzRA3x3jmVFM=;
 h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
 b=N2K4AQ+LzyA+NQ1tcvIIBzcYyQk6q7HG9wiJD1nFeLk9Bz7yHoa7/vaJ4E79qOTFm
 RsEL3gv0RPO8SDVE8iM2v4v7+B1vZIpQ5rAeXb0nFUPY+7dgtdOzxac5dZebLcdKYM
 aKDEy+NazXauBzYTpvnyZk6/Sy0k370x5nNft6RW2OdttceHz0G6UccjyAR8r7psP+
 C4mBo1nJ/da6D/peOhGQFt+1OpVRWhtaGl+xhLv9WNcn7ELB6mRs9BSIKuAqwpiOb/
 iM6GwAXGnfV808ulP+ifov4Iaz2DJroUPZqSgmBNz4fFQXv+9acYRyaFNtZDWipf5O
 1sZGPMQYlOYBw==
From: Michael Ellerman <mpe@ellerman.id.au>
To: Markus Elfring <Markus.Elfring@web.de>,
 Liao Pingfang <liao.pingfang@zte.com.cn>, linuxppc-dev@lists.ozlabs.org,
 Joe Perches <joe@perches.com>
Subject: Re: [PATCH] powerpc/nvram: Replace kmalloc with kzalloc in the error
 message
In-Reply-To: <a3c158fa-3829-f38a-9202-8984b5ef5f21@web.de>
References: <c3d22d89-9133-30aa-8270-c515df214963@web.de>
 <87imgai394.fsf@mpe.ellerman.id.au>
 <a3c158fa-3829-f38a-9202-8984b5ef5f21@web.de>
Date: Tue, 02 Jun 2020 21:23:57 +1000
Message-ID: <87a71liucy.fsf@mpe.ellerman.id.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
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
Cc: Yi Wang <wang.yi59@zte.com.cn>, Tony Luck <tony.luck@intel.com>,
 Kees Cook <keescook@chromium.org>, Wang Liang <wang.liang82@zte.com.cn>,
 Anton Vorontsov <anton@enomsg.org>, kernel-janitors@vger.kernel.org,
 LKML <linux-kernel@vger.kernel.org>, Colin Cross <ccross@android.com>,
 Paul Mackerras <paulus@samba.org>, Xue Zhihong <xue.zhihong@zte.com.cn>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Thomas Gleixner <tglx@linutronix.de>, Allison Randal <allison@lohutok.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Markus Elfring <Markus.Elfring@web.de> writes:
>>>> Please just remove the message instead, it's a tiny allocation that's
>>>> unlikely to ever fail, and the caller will print an error anyway.
>>>
>>> How do you think about to take another look at a previous update sugges=
tion
>>> like the following?
>>>
>>> powerpc/nvram: Delete three error messages for a failed memory allocati=
on
>>> https://patchwork.ozlabs.org/project/linuxppc-dev/patch/00845261-8528-d=
011-d3b8-e9355a231d3a@users.sourceforge.net/
>>> https://lore.kernel.org/linuxppc-dev/00845261-8528-d011-d3b8-e9355a231d=
3a@users.sourceforge.net/
>>> https://lore.kernel.org/patchwork/patch/752720/
>>> https://lkml.org/lkml/2017/1/19/537
>>
>> That deleted the messages from nvram_scan_partitions(), but neither of
>> the callers of nvram_scan_paritions() check its return value or print
>> anything if it fails. So removing those messages would make those
>> failures silent which is not what we want.
>
> * How do you think about information like the following?
>   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree=
/Documentation/process/coding-style.rst?id=3Df359287765c04711ff54fbd1164527=
1d8e5ff763#n883
> =E2=80=9C=E2=80=A6
> These generic allocation functions all emit a stack dump on failure when =
used
> without __GFP_NOWARN so there is no use in emitting an additional failure
> message when NULL is returned.
> =E2=80=A6=E2=80=9D

Are you sure that's actually true?

A quick look around in slub.c leads me to:

slab_out_of_memory(struct kmem_cache *s, gfp_t gfpflags, int nid)
{
#ifdef CONFIG_SLUB_DEBUG
	static DEFINE_RATELIMIT_STATE(slub_oom_rs, DEFAULT_RATELIMIT_INTERVAL,
				      DEFAULT_RATELIMIT_BURST);
	int node;
	struct kmem_cache_node *n;

	if ((gfpflags & __GFP_NOWARN) || !__ratelimit(&slub_oom_rs))
		return;

	pr_warn("SLUB: Unable to allocate memory on node %d, gfp=3D%#x(%pGg)\n",
		nid, gfpflags, &gfpflags);
	pr_warn("  cache: %s, object size: %u, buffer size: %u, default order: %u,=
 min order: %u\n",
		s->name, s->object_size, s->size, oo_order(s->oo),
		oo_order(s->min));

	if (oo_order(s->min) > get_order(s->object_size))
		pr_warn("  %s debugging increased min order, use slub_debug=3DO to disabl=
e.\n",
			s->name);

	for_each_kmem_cache_node(s, node, n) {
		unsigned long nr_slabs;
		unsigned long nr_objs;
		unsigned long nr_free;

		nr_free  =3D count_partial(n, count_free);
		nr_slabs =3D node_nr_slabs(n);
		nr_objs  =3D node_nr_objs(n);

		pr_warn("  node %d: slabs: %ld, objs: %ld, free: %ld\n",
			node, nr_slabs, nr_objs, nr_free);
	}
#endif
}

Which looks a lot like it won't print anything when CONFIG_SLUB_DEBUG=3Dn.

But maybe I'm looking in the wrong place?

cheers
