Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id CE59267D9C1
	for <lists+linuxppc-dev@lfdr.de>; Fri, 27 Jan 2023 00:39:45 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4P2xy75Bm4z3fGq
	for <lists+linuxppc-dev@lfdr.de>; Fri, 27 Jan 2023 10:39:43 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=g6B2e931;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=flex--irogers.bounces.google.com (client-ip=2607:f8b0:4864:20::114a; helo=mail-yw1-x114a.google.com; envelope-from=3qq7tywckddgcliaylmaiiafy.wigfchorjjw-xypfcmnm.itfuvm.ila@flex--irogers.bounces.google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=g6B2e931;
	dkim-atps=neutral
Received: from mail-yw1-x114a.google.com (mail-yw1-x114a.google.com [IPv6:2607:f8b0:4864:20::114a])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4P2xvH703Nz3fGk
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 27 Jan 2023 10:37:15 +1100 (AEDT)
Received: by mail-yw1-x114a.google.com with SMTP id 00721157ae682-506466c484fso37622937b3.13
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 26 Jan 2023 15:37:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=cc:to:from:subject:references:mime-version:message-id:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=zVzLGDFk0ATwExjUMDftjSNFZ72W3NZoCawlQdDdpKY=;
        b=g6B2e931x3l/7IDGJTFRhdD+fs2W/iVGC/9/OGD/9xMyNzGYszCJRBhKhZt8qdb0WS
         Mj4civh5fQtEFSx7ZF/uP0ogEmf9FMzTNTsU8yOqUqcVDSt5VwMNO54ItUxJPiA8uJTg
         AL1z5/zKgUzr27kAbh21VOmJTCvtddk6RlAZjaVOzky+kZxObvNrMiuJFnCpUkFR4yvq
         dKqqGywWp2j8skVstAWywqYG+9Pko+yV+k+DLlDTB+OMOjp8bxuAroLXZbINOHKvRfbz
         dAbYmSe2q28FTiGup4oyTPsrSx8RsMEOI/JK4pIcY9DLJ4ch4Zxbzv+g9fBeBmdT/Yar
         Kv1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:from:subject:references:mime-version:message-id:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=zVzLGDFk0ATwExjUMDftjSNFZ72W3NZoCawlQdDdpKY=;
        b=3G/5kKgHSkMLuTdmVIXnG4ZThHAoaowIwPu+A/C6TaJanUX0HEVuqxRQ/gBpEi99+L
         m3MMvQtEqRSGtX0W8zkQbMPqFZahTuoUG3DLPDjRLWxZJyI2FwFW3hHb0Er00cpObpn+
         l7tEb1VegT4QB4LVuK56fhfSa9fsqV+aMe+iux1j8H78MnBP7m1zyXn1QCj7iV42boEB
         OIpde1J1fNzrYVy2qcshqBvuDbSZFUCuuaZvmN4ms3C3elCSg51l7UY8MU7yltgQ8nbc
         3Vo9iiXBaijb0YiRvsCknI9GKlLDP0gP4yS2voo2exTvTl+CLggYYCMrXBxbvA7FX4wo
         qEfA==
X-Gm-Message-State: AO0yUKWvTDiCJ463rEDaOIs6caAMPIHqRIrR/HNt1Se/1gqIWFe5x8jv
	c5IHPgSANffvm/qahPTxN5+6+z6bQobz
X-Google-Smtp-Source: AK7set+Iv2jmW6JOcsgy1uCNPGEoi/rn7S52ZxdpjWt6UB9uRDAOijygh48h7MPGC6ch2gn93vDjHr3/VJ1L
X-Received: from irogers.svl.corp.google.com ([2620:15c:2d4:203:b9b8:6de0:39b3:4cf7])
 (user=irogers job=sendgmr) by 2002:a25:6e84:0:b0:80b:4da5:cf19 with SMTP id
 j126-20020a256e84000000b0080b4da5cf19mr1962472ybc.455.1674776233289; Thu, 26
 Jan 2023 15:37:13 -0800 (PST)
Date: Thu, 26 Jan 2023 15:36:32 -0800
In-Reply-To: <20230126233645.200509-1-irogers@google.com>
Message-Id: <20230126233645.200509-3-irogers@google.com>
Mime-Version: 1.0
References: <20230126233645.200509-1-irogers@google.com>
X-Mailer: git-send-email 2.39.1.456.gfc5497dd1b-goog
Subject: [PATCH v5 02/15] perf jevents metric: Add ability to rewrite metrics
 in terms of others
From: Ian Rogers <irogers@google.com>
To: John Garry <john.g.garry@oracle.com>, Will Deacon <will@kernel.org>, 
	James Clark <james.clark@arm.com>, Mike Leach <mike.leach@linaro.org>, 
	Leo Yan <leo.yan@linaro.org>, Peter Zijlstra <peterz@infradead.org>, 
	Ingo Molnar <mingo@redhat.com>, Arnaldo Carvalho de Melo <acme@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
	Alexander Shishkin <alexander.shishkin@linux.intel.com>, Jiri Olsa <jolsa@kernel.org>, 
	Namhyung Kim <namhyung@kernel.org>, Adrian Hunter <adrian.hunter@intel.com>, 
	Kan Liang <kan.liang@linux.intel.com>, Kim Phillips <kim.phillips@amd.com>, 
	Florian Fischer <florian.fischer@muhq.space>, Ravi Bangoria <ravi.bangoria@amd.com>, 
	Xing Zhengjun <zhengjun.xing@linux.intel.com>, Rob Herring <robh@kernel.org>, 
	Kang Minchul <tegongkang@gmail.com>, linux-arm-kernel@lists.infradead.org, 
	linux-perf-users@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Sandipan Das <sandipan.das@amd.com>, Jing Zhang <renyu.zj@linux.alibaba.com>, 
	linuxppc-dev@lists.ozlabs.org, Kajol Jain <kjain@linux.ibm.com>
Content-Type: text/plain; charset="UTF-8"
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
Cc: Ian Rogers <irogers@google.com>, Perry Taylor <perry.taylor@intel.com>, Caleb Biggers <caleb.biggers@intel.com>, Stephane Eranian <eranian@google.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Add RewriteMetricsInTermsOfOthers that iterates over pairs of names
and expressions trying to replace an expression, within the current
expression, with its name.
---
 tools/perf/pmu-events/metric.py      | 73 +++++++++++++++++++++++++++-
 tools/perf/pmu-events/metric_test.py | 10 ++++
 2 files changed, 81 insertions(+), 2 deletions(-)

diff --git a/tools/perf/pmu-events/metric.py b/tools/perf/pmu-events/metric.py
index 2f2fd220e843..77ea6ff98538 100644
--- a/tools/perf/pmu-events/metric.py
+++ b/tools/perf/pmu-events/metric.py
@@ -4,7 +4,7 @@ import ast
 import decimal
 import json
 import re
-from typing import Dict, List, Optional, Set, Union
+from typing import Dict, List, Optional, Set, Tuple, Union
 
 
 class Expression:
@@ -26,6 +26,9 @@ class Expression:
     """Returns true when two expressions are the same."""
     raise NotImplementedError()
 
+  def Substitute(self, name: str, expression: 'Expression') -> 'Expression':
+    raise NotImplementedError()
+
   def __str__(self) -> str:
     return self.ToPerfJson()
 
@@ -186,6 +189,15 @@ class Operator(Expression):
           other.lhs) and self.rhs.Equals(other.rhs)
     return False
 
+  def Substitute(self, name: str, expression: Expression) -> Expression:
+    if self.Equals(expression):
+      return Event(name)
+    lhs = self.lhs.Substitute(name, expression)
+    rhs = None
+    if self.rhs:
+      rhs = self.rhs.Substitute(name, expression)
+    return Operator(self.operator, lhs, rhs)
+
 
 class Select(Expression):
   """Represents a select ternary in the parse tree."""
@@ -225,6 +237,14 @@ class Select(Expression):
           other.false_val) and self.true_val.Equals(other.true_val)
     return False
 
+  def Substitute(self, name: str, expression: Expression) -> Expression:
+    if self.Equals(expression):
+      return Event(name)
+    true_val = self.true_val.Substitute(name, expression)
+    cond = self.cond.Substitute(name, expression)
+    false_val = self.false_val.Substitute(name, expression)
+    return Select(true_val, cond, false_val)
+
 
 class Function(Expression):
   """A function in an expression like min, max, d_ratio."""
@@ -267,6 +287,15 @@ class Function(Expression):
       return result
     return False
 
+  def Substitute(self, name: str, expression: Expression) -> Expression:
+    if self.Equals(expression):
+      return Event(name)
+    lhs = self.lhs.Substitute(name, expression)
+    rhs = None
+    if self.rhs:
+      rhs = self.rhs.Substitute(name, expression)
+    return Function(self.fn, lhs, rhs)
+
 
 def _FixEscapes(s: str) -> str:
   s = re.sub(r'([^\\]),', r'\1\\,', s)
@@ -293,6 +322,9 @@ class Event(Expression):
   def Equals(self, other: Expression) -> bool:
     return isinstance(other, Event) and self.name == other.name
 
+  def Substitute(self, name: str, expression: Expression) -> Expression:
+    return self
+
 
 class Constant(Expression):
   """A constant within the expression tree."""
@@ -317,6 +349,9 @@ class Constant(Expression):
   def Equals(self, other: Expression) -> bool:
     return isinstance(other, Constant) and self.value == other.value
 
+  def Substitute(self, name: str, expression: Expression) -> Expression:
+    return self
+
 
 class Literal(Expression):
   """A runtime literal within the expression tree."""
@@ -336,6 +371,9 @@ class Literal(Expression):
   def Equals(self, other: Expression) -> bool:
     return isinstance(other, Literal) and self.value == other.value
 
+  def Substitute(self, name: str, expression: Expression) -> Expression:
+    return self
+
 
 def min(lhs: Union[int, float, Expression], rhs: Union[int, float,
                                                        Expression]) -> Function:
@@ -461,6 +499,7 @@ class MetricGroup:
 
 
 class _RewriteIfExpToSelect(ast.NodeTransformer):
+  """Transformer to convert if-else nodes to Select expressions."""
 
   def visit_IfExp(self, node):
     # pylint: disable=invalid-name
@@ -498,7 +537,37 @@ def ParsePerfJson(orig: str) -> Expression:
   for kw in keywords:
     py = re.sub(rf'Event\(r"{kw}"\)', kw, py)
 
-  parsed = ast.parse(py, mode='eval')
+  try:
+    parsed = ast.parse(py, mode='eval')
+  except SyntaxError as e:
+    raise SyntaxError(f'Parsing expression:\n{orig}') from e
   _RewriteIfExpToSelect().visit(parsed)
   parsed = ast.fix_missing_locations(parsed)
   return _Constify(eval(compile(parsed, orig, 'eval')))
+
+
+def RewriteMetricsInTermsOfOthers(metrics: List[Tuple[str, Expression]]
+                                  )-> Dict[str, Expression]:
+  """Shorten metrics by rewriting in terms of others.
+
+  Args:
+    metrics (list): pairs of metric names and their expressions.
+  Returns:
+    Dict: mapping from a metric name to a shortened expression.
+  """
+  updates: Dict[str, Expression] = dict()
+  for outer_name, outer_expression in metrics:
+    updated = outer_expression
+    while True:
+      for inner_name, inner_expression in metrics:
+        if inner_name.lower() == outer_name.lower():
+          continue
+        if inner_name in updates:
+          inner_expression = updates[inner_name]
+        updated = updated.Substitute(inner_name, inner_expression)
+      if updated.Equals(outer_expression):
+        break
+      if outer_name in updates and updated.Equals(updates[outer_name]):
+        break
+      updates[outer_name] = updated
+  return updates
diff --git a/tools/perf/pmu-events/metric_test.py b/tools/perf/pmu-events/metric_test.py
index 15315d0f716c..ced5998bd827 100644
--- a/tools/perf/pmu-events/metric_test.py
+++ b/tools/perf/pmu-events/metric_test.py
@@ -2,7 +2,9 @@
 import unittest
 from metric import Constant
 from metric import Event
+from metric import Expression
 from metric import ParsePerfJson
+from metric import RewriteMetricsInTermsOfOthers
 
 
 class TestMetricExpressions(unittest.TestCase):
@@ -153,5 +155,13 @@ class TestMetricExpressions(unittest.TestCase):
     after = '0 * SLOTS'
     self.assertEqual(ParsePerfJson(before).Simplify().ToPerfJson(), after)
 
+  def test_RewriteMetricsInTermsOfOthers(self):
+    Expression.__eq__ = lambda e1, e2: e1.Equals(e2)
+    before = [('m1', ParsePerfJson('a + b + c + d')),
+              ('m2', ParsePerfJson('a + b + c'))]
+    after = {'m1': ParsePerfJson('m2 + d')}
+    self.assertEqual(RewriteMetricsInTermsOfOthers(before), after)
+    Expression.__eq__ = None
+
 if __name__ == '__main__':
   unittest.main()
-- 
2.39.1.456.gfc5497dd1b-goog

