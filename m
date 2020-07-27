Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id D2CAD22E61B
	for <lists+linuxppc-dev@lfdr.de>; Mon, 27 Jul 2020 08:53:23 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BFVrJ2Y32zDsQB
	for <lists+linuxppc-dev@lfdr.de>; Mon, 27 Jul 2020 16:53:20 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=perches.com
 (client-ip=216.40.44.120; helo=smtprelay.hostedemail.com;
 envelope-from=joe@perches.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=perches.com
Received: from smtprelay.hostedemail.com (smtprelay0120.hostedemail.com
 [216.40.44.120])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BFVpb6fcvzDrdQ
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 27 Jul 2020 16:51:49 +1000 (AEST)
Received: from filter.hostedemail.com (clb03-v110.bra.tucows.net
 [216.40.38.60])
 by smtprelay07.hostedemail.com (Postfix) with ESMTP id A7422181D341E;
 Mon, 27 Jul 2020 06:51:45 +0000 (UTC)
X-Session-Marker: 6A6F6540706572636865732E636F6D
X-Spam-Summary: 2, 0, 0, , d41d8cd98f00b204, joe@perches.com, ,
 RULES_HIT:41:355:379:599:871:973:981:982:988:989:1000:1260:1313:1314:1345:1359:1437:1516:1518:1535:1544:1575:1594:1605:1711:1730:1747:1764:1777:1792:1963:2393:2559:2562:2693:2736:2915:3138:3139:3140:3141:3142:3622:3653:3865:3866:3867:3868:3870:3871:3872:3873:3874:4118:4250:4321:4605:5007:6506:6747:6748:7281:7875:7903:10004:10394:10848:11026:11232:11473:11604:11658:11914:12043:12294:12296:12297:12438:12555:12740:12895:12986:13138:13231:13439:14096:14659:14721:21080:21324:21433:21611:21627:21789:21795:21966:21987:21990:30012:30034:30045:30051:30054:30070:30091,
 0, RBL:none, CacheIP:none, Bayesian:0.5, 0.5, 0.5, Netcheck:none,
 DomainCache:0, MSF:not bulk, SPF:, MSBL:0, DNSBL:none, Custom_rules:0:0:0,
 LFtime:20, LUA_SUMMARY:none
X-HE-Tag: queen93_051184626f5f
X-Filterd-Recvd-Size: 7348
Received: from XPS-9350.home (unknown [47.151.133.149])
 (Authenticated sender: joe@perches.com)
 by omf16.hostedemail.com (Postfix) with ESMTPA;
 Mon, 27 Jul 2020 06:51:44 +0000 (UTC)
Message-ID: <16aa5f86f2f899a9156305ead4b7042449278eea.camel@perches.com>
Subject: Re: [PATCH 0/9] powerpc: delete duplicated words
From: Joe Perches <joe@perches.com>
To: Randy Dunlap <rdunlap@infradead.org>, Christophe Leroy
 <christophe.leroy@csgroup.eu>
Date: Sun, 26 Jul 2020 23:51:43 -0700
In-Reply-To: <4e505c35-8428-89bb-7f9b-bc819382c3cd@infradead.org>
References: <20200726162902.Horde.TCqHYaODbkzEpM-rFzDd8A2@messagerie.si.c-s.fr>
 <b796e912-e945-3cb1-03f8-0f38009634a4@infradead.org>
 <add7c13b1ca24c8cb6f243b99d61c19287020efd.camel@perches.com>
 <4e505c35-8428-89bb-7f9b-bc819382c3cd@infradead.org>
Content-Type: multipart/mixed; boundary="=-WZb3QuBXr/QXwN41SYgI"
User-Agent: Evolution 3.36.3-0ubuntu1 
MIME-Version: 1.0
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
Cc: Paul Mackerras <paulus@samba.org>, linuxppc-dev@lists.ozlabs.org,
 linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>


--=-WZb3QuBXr/QXwN41SYgI
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit

On Sun, 2020-07-26 at 12:08 -0700, Randy Dunlap wrote:

> v0.1 of this script also found lots of repeated numbers and strings of
> special characters (ASCII art etc.), so now it ignores duplicated numbers
> or special characters -- since it is really looking for duplicate words.
> 
> Anyway, I might as well attach it. It's no big deal.
> And if someone else wants to tackle using it, go for it.

This might be a reasonable thing to add to checkpatch.

And here's another possible similar perl word deduplicator attached:

Assuming you have git, this could be used like:

$ git ls-files -- <dir> | xargs perl deduplicate_words.pl

And it would overwrite all files with duplicated words.

No guarantees any changes it makes are right of course.
It still needs a human to verify any change.

For instance:

$ git ls-files kernel/trace/*.[ch] | xargs perl deduplicate_words.pl
$ git diff kernel/trace
 kernel/trace/ftrace.c             | 2 +-
 kernel/trace/trace.c              | 2 +-
 kernel/trace/trace_dynevent.c     | 2 +-
 kernel/trace/trace_events_synth.c | 2 +-
 kernel/trace/tracing_map.c        | 2 +-
 5 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/kernel/trace/ftrace.c b/kernel/trace/ftrace.c
index a3093a84bae3..b7f085a4f71a 100644
--- a/kernel/trace/ftrace.c
+++ b/kernel/trace/ftrace.c
@@ -2405,7 +2405,7 @@ struct ftrace_ops direct_ops = {
  *
  * If the record has the FTRACE_FL_REGS set, that means that it
  * wants to convert to a callback that saves all regs. If FTRACE_FL_REGS
- * is not not set, then it wants to convert to the normal callback.
+ * is not set, then it wants to convert to the normal callback.
  *
  * Returns the address of the trampoline to set to
  */
diff --git a/kernel/trace/trace.c b/kernel/trace/trace.c
index 5aa5c01e2fed..4d3dcfb06d6d 100644
--- a/kernel/trace/trace.c
+++ b/kernel/trace/trace.c
@@ -9253,7 +9253,7 @@ void ftrace_dump(enum ftrace_dump_mode oops_dump_mode)
 
 	/*
 	 * We need to stop all tracing on all CPUS to read the
-	 * the next buffer. This is a bit expensive, but is
+	 * next buffer. This is a bit expensive, but is
 	 * not done often. We fill all what we can read,
 	 * and then release the locks again.
 	 */
diff --git a/kernel/trace/trace_dynevent.c b/kernel/trace/trace_dynevent.c
index 2c435fdef565..8c1e7e168505 100644
--- a/kernel/trace/trace_dynevent.c
+++ b/kernel/trace/trace_dynevent.c
@@ -402,7 +402,7 @@ void dynevent_arg_init(struct dynevent_arg *arg,
  * whitespace, all followed by a separator, if applicable.  After the
  * first arg string is successfully appended to the command string,
  * the optional @operator is appended, followed by the second arg and
- * and optional @separator.  If no separator was specified when
+ * optional @separator.  If no separator was specified when
  * initializing the arg, a space will be appended.
  */
 void dynevent_arg_pair_init(struct dynevent_arg_pair *arg_pair,
diff --git a/kernel/trace/trace_events_synth.c b/kernel/trace/trace_events_synth.c
index e2a623f2136c..3801d3088744 100644
--- a/kernel/trace/trace_events_synth.c
+++ b/kernel/trace/trace_events_synth.c
@@ -1211,7 +1211,7 @@ __synth_event_trace_start(struct trace_event_file *file,
 	 * ENABLED bit is set (which attaches the probe thus allowing
 	 * this code to be called, etc).  Because this is called
 	 * directly by the user, we don't have that but we still need
-	 * to honor not logging when disabled.  For the the iterated
+	 * to honor not logging when disabled.  For the iterated
 	 * trace case, we save the enabed state upon start and just
 	 * ignore the following data calls.
 	 */
diff --git a/kernel/trace/tracing_map.c b/kernel/trace/tracing_map.c
index 74738c9856f1..4b50fc0cb12c 100644
--- a/kernel/trace/tracing_map.c
+++ b/kernel/trace/tracing_map.c
@@ -260,7 +260,7 @@ int tracing_map_add_var(struct tracing_map *map)
  * to use cmp_fn.
  *
  * A key can be a subset of a compound key; for that purpose, the
- * offset param is used to describe where within the the compound key
+ * offset param is used to describe where within the compound key
  * the key referenced by this key field resides.
  *
  * Return: The index identifying the field in the map and associated


--=-WZb3QuBXr/QXwN41SYgI
Content-Type: application/x-perl; name="deduplicate_words.pl"
Content-Disposition: attachment; filename="deduplicate_words.pl"
Content-Transfer-Encoding: base64

IyEvdXNyL2Jpbi9lbnYvcGVybAoKIyBkZWR1cGxjYXRlIHJlcGVhdGVkIHdvcmRzIGZyb20gLltj
aF0gZmlsZXMKCm15ICR3b3JkID0gJ1xiW0EtWl0/W2Etel17Mix9XGInOwoKZm9yIG15ICRmaWxl
bmFtZSAoQEFSR1YpIHsKICAgIG15ICRvbGRsaW5lID0gJyc7CiAgICBteSBAb3V0cHV0ID0gKCk7
CgogICAgaWYgKCRmaWxlbmFtZSBlcSAnLScpIHsKCW9wZW4oJEZJTEUsICc8JlNURElOJyk7CiAg
ICB9IGVsc2UgewoJb3BlbigkRklMRSwgJzwnLCAiJGZpbGVuYW1lIikgfHwKCSAgICBkaWUgIiRQ
OiAkZmlsZW5hbWU6IG9wZW4gZmFpbGVkIC0gJCFcbiI7CiAgICB9CgogICAgd2hpbGUgKDwkRklM
RT4pIHsKCW15ICRuZXdsaW5lID0gJF87Cgl3aGlsZSAoJG5ld2xpbmUgPX4gL1xiKCR3b3JkKSAo
Pz0oJHdvcmQpKS9nKSB7CgoJICAgICRmaXJzdCA9ICQxOwoJICAgICRzZWNvbmQgPSAkMjsKCgkg
ICAgaWYgKCRmaXJzdCA9fiAvKD86c3RydWN0fHVuaW9ufGVudW0pLykgewoJCXBvcygkbmV3bGlu
ZSkgKz0gbGVuZ3RoKCRmaXJzdCkgKyBsZW5ndGgoJHNlY29uZCkgKyAxOwoJCW5leHQ7CgkgICAg
fQoKCSAgICBuZXh0IGlmICgkZmlyc3QgbmUgJHNlY29uZCk7CgkgICAgbmV4dCBpZiAoJGZpcnN0
IGVxICdsb25nJyk7CgoJICAgICRuZXdsaW5lID1+IHMvXGIkZmlyc3QgJHNlY29uZFxiLyRmaXJz
dC87Cgl9CgoJIyBpZiBpdCdzIGEgcmVwZWF0ZWQgd29yZCBvbiBjb25zZWN1dGl2ZSBsaW5lcyBp
biBhIGNvbW1lbnQgYmxvY2sKCWlmICgkb2xkbGluZSA9fiAvKCR3b3JkKVxzKiQvKSB7CgkgICAg
bXkgJGxhc3Rfd29yZCA9ICQxOwoJICAgICRuZXdsaW5lID1+IHMvKF5ccypcKlxzKikkbGFzdF93
b3JkIC8kMS87Cgl9CgoJcHVzaCAoQG91dHB1dCwgJG5ld2xpbmUpOwoKCSRvbGRsaW5lID0gJG5l
d2xpbmU7CiAgICB9CgogICAgY2xvc2UoJEZJTEUpOwoKICAgIGlmICgkZmlsZW5hbWUgZXEgJy0n
KSB7CglvcGVuKCRGSUxFLCAnPCZTVERPVVQnKTsKICAgIH0gZWxzZSB7CglvcGVuKCRGSUxFLCAn
PicsICIkZmlsZW5hbWUiKSB8fAoJICAgIGRpZSAiJFA6ICRmaWxlbmFtZTogb3BlbiBmYWlsZWQg
LSAkIVxuIjsKICAgIH0KICAgIGZvcmVhY2ggbXkgJGxpbmUgKEBvdXRwdXQpIHsKCXByaW50ICRG
SUxFICRsaW5lOwogICAgfQoKICAgIGNsb3NlICgkRklMRSk7Cn0K


--=-WZb3QuBXr/QXwN41SYgI--

