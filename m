Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B4DD5E71D3
	for <lists+linuxppc-dev@lfdr.de>; Fri, 23 Sep 2022 04:21:31 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MYbVx0SyJz3cdB
	for <lists+linuxppc-dev@lfdr.de>; Fri, 23 Sep 2022 12:21:29 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.helo=relay.hostedemail.com (client-ip=216.40.44.14; helo=relay.hostedemail.com; envelope-from=joe@perches.com; receiver=<UNKNOWN>)
X-Greylist: delayed 544 seconds by postgrey-1.36 at boromir; Fri, 23 Sep 2022 12:21:05 AEST
Received: from relay.hostedemail.com (smtprelay0014.hostedemail.com [216.40.44.14])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MYbVT2LbTz3bcF
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 23 Sep 2022 12:21:03 +1000 (AEST)
Received: from omf12.hostedemail.com (a10.router.float.18 [10.200.18.1])
	by unirelay07.hostedemail.com (Postfix) with ESMTP id C9E20160333;
	Fri, 23 Sep 2022 02:11:51 +0000 (UTC)
Received: from [HIDDEN] (Authenticated sender: joe@perches.com) by omf12.hostedemail.com (Postfix) with ESMTPA id 7D8BE19;
	Fri, 23 Sep 2022 02:11:41 +0000 (UTC)
Message-ID: <3179f4545d3f71358da3e6c6ee18085af601b2eb.camel@perches.com>
Subject: Re: [PATCH v1 3/3] checkpatch: warn on usage of VM_BUG_ON() and
 other BUG variants
From: Joe Perches <joe@perches.com>
To: John Hubbard <jhubbard@nvidia.com>, David Hildenbrand
 <david@redhat.com>,  linux-kernel@vger.kernel.org
Date: Thu, 22 Sep 2022 19:11:44 -0700
In-Reply-To: <d0c59eb8-baca-26fd-5f10-4a1f89bcf7b9@nvidia.com>
References: <20220920122302.99195-1-david@redhat.com>
	 <20220920122302.99195-4-david@redhat.com>
	 <d0c59eb8-baca-26fd-5f10-4a1f89bcf7b9@nvidia.com>
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.44.4 (3.44.4-1.fc36) 
MIME-Version: 1.0
X-Stat-Signature: me7gijswwjx78bt11de9ttdkeerub4ce
X-Rspamd-Server: rspamout04
X-Rspamd-Queue-Id: 7D8BE19
X-Spam-Status: No, score=0.48
X-Session-Marker: 6A6F6540706572636865732E636F6D
X-Session-ID: U2FsdGVkX1+TmJmbnGkm+LNw6VlDjRWiozpu+WDNQbw=
X-HE-Tag: 1663899101-987245
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
Cc: Baoquan He <bhe@redhat.com>, linux-doc@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, Dave Young <dyoung@redhat.com>, Jonathan Corbet <corbet@lwn.net>, Nicholas Piggin <npiggin@gmail.com>, Jani Nikula <jani.nikula@linux.intel.com>, linux-mm@kvack.org, David Laight <David.Laight@ACULAB.COM>, Dwaipayan Ray <dwaipayanray1@gmail.com>, Andy Whitcroft <apw@canonical.com>, Lukas Bulwahn <lukas.bulwahn@gmail.com>, Andrew Morton <akpm@linux-foundation.org>, Linus Torvalds <torvalds@linux-foundation.org>, Ingo Molnar <mingo@kernel.org>, Vivek Goyal <vgoyal@redhat.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, 2022-09-22 at 19:05 -0700, John Hubbard wrote:
> On 9/20/22 05:23, David Hildenbrand wrote:
> > checkpatch does not point out that VM_BUG_ON() and friends should be
> > avoided, however, Linus notes:
> >=20
> >     VM_BUG_ON() has the exact same semantics as BUG_ON. It is literally
> >     no different, the only difference is "we can make the code smaller
> >     because these are less important". [1]
> >=20
> > So let's warn on VM_BUG_ON() and other BUG variants as well. While at i=
t,
> > make it clearer that the kernel really shouldn't be crashed.
> >=20
> > As there are some subsystem BUG macros that actually don't end up crash=
ing
> > the kernel -- for example, KVM_BUG_ON() -- exclude these manually.
> >=20
> > [1] https://lore.kernel.org/r/CAHk-=3Dwg40EAZofO16Eviaj7mfqDhZ2gVEbvfsM=
f6gYzspRjYvw@mail.gmail.com
[]
> > diff --git a/scripts/checkpatch.pl b/scripts/checkpatch.pl
[]
> > @@ -4695,12 +4695,12 @@ sub process {
> >  			}
> >  		}
> > =20
> > -# avoid BUG() or BUG_ON()
> > -		if ($line =3D~ /\b(?:BUG|BUG_ON)\b/) {
> > +# do not use BUG() or variants
> > +		if ($line =3D~ /\b(?!AA_|BUILD_|DCCP_|IDA_|KVM_|RWLOCK_|snd_|SPIN_)(=
?:[a-zA-Z_]*_)?BUG(?:_ON)?(?:_[A-Z_]+)?\s*\(/) {
>=20
> Should this be a separate patch? Adding a bunch of exceptions to the BUG(=
) rules is=20
> a separate and distinct thing from adding VM_BUG_ON() and other *BUG*() v=
ariants to
> the mix.

Not in my opinion.

> >  			my $msg_level =3D \&WARN;
> >  			$msg_level =3D \&CHK if ($file);
> >  			&{$msg_level}("AVOID_BUG",
> > -				      "Avoid crashing the kernel - try using WARN_ON & recovery co=
de rather than BUG() or BUG_ON()\n" . $herecurr);
> > +				      "Do not crash the kernel unless it is unavoidable - use WARN=
_ON_ONCE & recovery code (if reasonable) rather than BUG() or variants.\n" =
. $herecurr);
>=20
> Here's a requested tweak, to clean up the output and fix punctuation:
>=20
> "Avoid crashing the kernel--use WARN_ON_ONCE() plus recovery code (if fea=
sible) instead of BUG() or variants.\n" . $herecurr);

Fixing punctuation here would be removing the trailing period as checkpatch
only has periods for multi-sentence output messages.

And I think that "Do not crash" is a stronger statement than "Avoid crashin=
g"
so I prefer the original suggestion but it's not a big deal either way.
